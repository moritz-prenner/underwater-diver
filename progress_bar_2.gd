extends ProgressBar

var hp = 100

@onready var game_over: Panel = $"../GameOver"
@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var camera: Camera2D = $"../../CharacterBody2D/Camera2D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hp += 0.02
	value = hp
	if hp < 0:
		game_over.gameOver()

func damage(newValue):
	hp -= newValue
	camera.shake()
	player.play_hurt()
	value = hp
	
