extends Panel

@onready var timer: Panel = $"../Timer"
@onready var display_finished_time: Label = $displayFinishedTime

var finishedTime
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
func gameEnded():
	finishedTime = timer.getElapsedTime()
	display_finished_time.text = finishedTime

func _on_button_pressed() -> void:
	get_tree().paused = false
	
