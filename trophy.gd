extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var stars: Area2D = $"../stars"
@onready var level_cleared: Panel = $"../UI/LevelCleared"

var firstTime = false 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		level_cleared.clear()
		firstTime = true
		
		
