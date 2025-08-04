extends ProgressBar

var oxygen = 100
const oxygenConsumption = 0.075

@onready var game_over: Panel = $"../GameOver"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = oxygen


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	oxygen -= oxygenConsumption
	value = oxygen
	if oxygen < 0:
		game_over.gameOver()

func newOxygen(newValue):
	oxygen += newValue
	value = oxygen
	
