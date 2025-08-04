extends CharacterBody2D

const SPEED = 150.0
const SPEED_UP = 200.0
const SPEED_DOWN = 150.0
const DASH_SPEED = 1000.0
const DASH_TIME = 0.2  # Dauer des Dashs in Sekunden
const DASH_COOLDOWN = 4.0  # Cooldown-Zeit in Sekunden

var dash_timer = 0.0
var dash_cooldown_timer = 0.0  # Neue Variable für Cooldown

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var col_default: CollisionShape2D = $CollisionShape2D_default
@onready var col_swim: CollisionShape2D = $CollisionShape2D_swim

func _physics_process(delta: float) -> void:
	var input_x = Input.get_axis("left", "right")
	var input_y = Input.get_axis("up", "down")

	# Cooldown-Zähler runterzählen
	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

	# Dash starten (nur, wenn nicht bereits am Dashen und Cooldown vorbei)
	if Input.is_action_just_pressed("dash") and dash_timer <= 0.0 and dash_cooldown_timer <= 0.0 and (input_x != 0 or input_y != 0):
		dash_timer = DASH_TIME
		dash_cooldown_timer = DASH_COOLDOWN  # Cooldown setzen
		velocity = Vector2(input_x, input_y).normalized() * DASH_SPEED

	# Dash läuft
	if dash_timer > 0.0:
		dash_timer -= delta
		# Während Dash bleibt velocity konstant
	else:
		# Normale Bewegung
		var target_velocity_x = input_x * SPEED

		var target_velocity_y = 0.0
		if input_y < 0:
			target_velocity_y = input_y * SPEED_UP
		elif input_y > 0:
			target_velocity_y = input_y * SPEED_DOWN

		velocity.x = target_velocity_x
		velocity.y = lerp(velocity.y, target_velocity_y, 0.1)

	# Bewegung ausführen
	move_and_slide()

	# Animation, Blickrichtung & CollisionShape wechseln
	if velocity.length() > 0.1:
		anim.play("swim")
		if input_x != 0:
			anim.flip_h = input_x < 0
		col_swim.disabled = false
		col_default.disabled = true
	else:
		anim.play("default")
		col_swim.disabled = true
		col_default.disabled = false

	# Rotation anpassen
	var target_rotation = 0.0
	if input_y > 0:
		target_rotation = deg_to_rad(20)
	elif input_y < 0:
		target_rotation = deg_to_rad(-20)

	var flip_sign = -1 if anim.flip_h else 1
	target_rotation *= flip_sign
	rotation = lerp(rotation, target_rotation, 0.1)
