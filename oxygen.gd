extends ProgressBar

var oxygen = 100
const oxygenConsumption = 0.075

var shaking = false

var shakePossible = true

var hitVisibleAllowed = true

@onready var game_over: Panel = $"../GameOver"
@onready var camera: Camera2D = $"../../CharacterBody2D/Camera2D"
@onready var hit: Panel = $"../hit"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = oxygen


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	oxygen -= oxygenConsumption
	value = oxygen
	if oxygen < 0:
		game_over.gameOver()


func newOxygen(newValue):
	oxygen += newValue
	value = oxygen
	
