extends Panel

var checkpoint = 0


@onready var player: CharacterBody2D = $"../../CharacterBody2D"
@onready var checkpoint1: Node2D = $"../../checkpoint1"
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gameOver():
	visible = true
	get_tree().paused = true


func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
	get_tree().paused = false
	match checkpoint:
		0:
			pass
		1:
			player.position = checkpoint1.position
