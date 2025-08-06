extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false



func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
