extends Panel

@onready var timer: Panel = $"../Timer"
@onready var display_finished_time: Label = $displayFinishedTime
@onready var submitTime: Panel = $submitTIme

var finishedTime
var finishedTimeOutput
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	add_to_group("end")

func format_time(ms: int) -> String:
	var total_sec = ms / 1000.0
	var minutes = int(total_sec / 60)
	var seconds = int(total_sec) % 60
	var millis = int(ms % 1000 / 10)  # z. B. 45 statt 453
	return "%02d:%02d.%02d" % [minutes, seconds, millis]

func gameEnded():
	timer.countTime = false
	visible = true
	finishedTime = timer.getElapsedTime()
	finishedTimeOutput = format_time(finishedTime)
	display_finished_time.text = finishedTimeOutput
	

func _on_button_pressed() -> void:
	get_tree().paused = false
	submitTime.visible = true
