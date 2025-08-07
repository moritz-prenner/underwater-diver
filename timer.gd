extends Panel

@onready var label: Label = $Label

var startTime = 0
var elapsedTime = 0
var countTime = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startTime = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if countTime == true:
		elapsedTime = Time.get_ticks_msec() - startTime
		label.text = format_time(elapsedTime)
	
	
func format_time(ms: int) -> String:
	var total_sec = ms / 1000.0
	var minutes = int(total_sec / 60)
	var seconds = int(total_sec) % 60
	var millis = int(ms % 1000 / 10)  # z. B. 45 statt 453
	return "%02d:%02d.%02d" % [minutes, seconds, millis]

func getElapsedTime():
	return elapsedTime
