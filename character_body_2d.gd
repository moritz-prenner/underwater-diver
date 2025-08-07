extends CharacterBody2D

const SPEED = 150.0
const SPEED_UP = 200.0
const SPEED_DOWN = 150.0
const DASH_SPEED = 1000.0
const DASH_TIME = 0.2
const DASH_COOLDOWN = 4.0
const HURT_DURATION = 1.0

var dash_timer = 0.0
var dash_cooldown_timer = 0.0
var hurt_timer = 0.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var col_default: CollisionShape2D = $CollisionShape2D_default
@onready var col_swim: CollisionShape2D = $CollisionShape2D_swim

func _physics_process(delta: float) -> void:
	if hurt_timer > 0.0:
		hurt_timer -= delta
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var input_vector = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	# Dash
	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

	if dash_timer > 0.0:
		dash_timer -= delta
		move_and_slide()
		return

	if Input.is_action_just_pressed("dash") and dash_timer <= 0.0 and dash_cooldown_timer <= 0.0 and input_vector != Vector2.ZERO:
		dash_timer = DASH_TIME
		dash_cooldown_timer = DASH_COOLDOWN
		velocity = input_vector * DASH_SPEED
		move_and_slide()
		return

	# Normale Bewegung
	var target_y_speed = SPEED
	if input_vector.y < 0:
		target_y_speed = SPEED_UP
	elif input_vector.y > 0:
		target_y_speed = SPEED_DOWN

	var target_velocity = input_vector * Vector2(SPEED, target_y_speed)
	velocity.x = target_velocity.x
	velocity.y = lerp(velocity.y, target_velocity.y, 0.15)

	move_and_slide()

	# Animationen
	if velocity.length() > 10.0:
		anim.play("swim")
		anim.flip_h = velocity.x < 0
		col_swim.disabled = false
		col_default.disabled = true
	else:
		anim.play("default")
		col_swim.disabled = true
		col_default.disabled = false

	# Rotation bei Bewegung
	var tilt = 0.0
	if input_vector.y != 0:
		tilt = deg_to_rad(20) * sign(input_vector.y)
	tilt *= -1 if anim.flip_h else 1
	rotation = lerp(rotation, tilt, 0.1)

func play_hurt():
	hurt_timer = HURT_DURATION
	anim.play("hurt")
	velocity = Vector2.ZERO
	
