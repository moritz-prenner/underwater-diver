extends Camera2D


# Called when the node enters the scene tree for the first time.
@export var max_shake: float = 8.0
@export var shake_fade: float = 6.0

var shake_strength = 0.0

func shake():
	shake_strength = max_shake
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
