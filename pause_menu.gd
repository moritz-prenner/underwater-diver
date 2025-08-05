extends Panel

@onready var options: Panel = $"../Panel2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		visible = true
		get_tree().paused = true
		
	


func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_button_2_pressed() -> void:
	options.visible = true
	visible = false
