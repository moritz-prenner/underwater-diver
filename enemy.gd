extends Path2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var path_follow: PathFollow2D = $PathFollow2D
@onready var area: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var player: CharacterBody2D = $"../CharacterBody2D"

var immunity: bool = false
var direction: int = 1

var flip_timer: Timer
var immunity_timer: Timer

func _ready() -> void:
	path_follow.rotation = 0 

	if not anim.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
		anim.connect("animation_finished", Callable(self, "_on_animation_finished"))
	
	# Flip-Timer initialisieren (4 Sek. Intervall)
	flip_timer = Timer.new()
	flip_timer.wait_time = 4.0
	flip_timer.one_shot = false
	add_child(flip_timer)
	flip_timer.connect("timeout", Callable(self, "_on_flip_timer_timeout"))
	flip_timer.start()
	
	# Immunitäts-Timer initialisieren (2 Sek. Einmalig)
	immunity_timer = Timer.new()
	immunity_timer.wait_time = 2.0
	immunity_timer.one_shot = true
	add_child(immunity_timer)
	immunity_timer.connect("timeout", Callable(self, "_on_immunity_timeout"))

	reset()

func _on_animation_finished(name: String) -> void:
	if name == "swim":
		anim.play("swim")

func _on_flip_timer_timeout() -> void:
	direction = -direction
	var scale = animated_sprite_2d.scale
	scale.x = direction
	animated_sprite_2d.scale = scale

func reset() -> void:
	anim.stop()
	path_follow.progress_ratio = 0.0
	direction = 1
	var scale = animated_sprite_2d.scale
	scale.x = direction
	animated_sprite_2d.scale = scale
	immunity = false

	anim.play("swim")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player and not immunity:
		get_tree().call_group("hearts", "damage", 20)  # Prüfe, ob damage() existiert, sonst hearts.value -= 20
		immunity = true
		immunity_timer.start()

func _on_immunity_timeout() -> void:
	immunity = false
