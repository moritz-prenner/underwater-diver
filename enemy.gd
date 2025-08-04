extends Path2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D

var current_sprite_animation: String = "default"

func _ready() -> void:
	animated_sprite_2d.play(current_sprite_animation)
	anim.play("swim")
	anim.connect("animation_finished", Callable(self, "_on_animation_finished"))
	change_sprite_animation()

func _on_animation_finished(name: String) -> void:
	if name == "swim":
		anim.play("swim")

func change_sprite_animation() -> void:
	# Endlosschleife, die alle 4 Sekunden zwischen den Animationen wechselt
	await get_tree().create_timer(4.0).timeout
	while true:
		# Umschalten zwischen "default" und "default2"
		if current_sprite_animation == "default":
			current_sprite_animation = "default2"
		else:
			current_sprite_animation = "default"
		
		animated_sprite_2d.play(current_sprite_animation)
		await get_tree().create_timer(4.0).timeout
