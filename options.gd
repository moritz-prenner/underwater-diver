extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_4_pressed() -> void:
	visible = false
	get_tree().paused = false
