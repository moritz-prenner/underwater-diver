extends Panel

var checkpoint = 0

var possibleTrigger = true

@onready var enemy: Path2D = $"../../enemy"



@onready var hit: Panel = $"../hit"
@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var checkpoint1: Node2D = $"../../checkpoint1"
@onready var button: Button = $Button
@onready var hp: ProgressBar = $"../ProgressBar2"
@onready var oxygen: ProgressBar = $"../ProgressBar"
@onready var checkpoint0: Node2D = $"../../checkpoint0"
@onready var checkpoint2: Node2D = $"../../checkpoint2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func gameOver():
	oxygen.shakePossible = false
	if possibleTrigger == true:
		visible = true
		get_tree().paused = true
		oxygen.hitVisibleAllowed = false
		hit.visible = false


func _on_button_pressed() -> void:
	oxygen.shakePossible = false
	possibleTrigger = false
	get_tree().paused = false
	visible = false
	hp.value = 100
	oxygen.value = 100
	match checkpoint:
		0:
			player.position = checkpoint0.position
		1:
			player.position = checkpoint1.position
		2:
			player.position = checkpoint2.position
		3:
			player.position = checkpoint2.position
	hp.hp = 100
	oxygen.oxygen = 100
	possibleTrigger = true
	enemy.reset()
	get_tree().call_group("bubbles", "reactivate")
	get_tree().call_group("stars", "reactivate")
