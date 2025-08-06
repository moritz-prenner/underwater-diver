extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var stars: Area2D = $"../stars"
@onready var level_cleared: Panel = $"../UI/LevelCleared"
@onready var gameOver: Panel = $"../UI/GameOver"
@onready var handeler: Node = $"../handeler"

var firstTime = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(gameOver.checkpoint)
	anim.play("default")



func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" and firstTime == false:
		anim.play("flag")
		await get_tree().create_timer(1.8).timeout
		anim.play("flag_out")
		firstTime = true
		handeler.touched()

		
		
