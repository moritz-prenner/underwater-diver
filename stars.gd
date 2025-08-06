extends Area2D

@onready var level: Panel = $"../UI/LevelCleared"



var firstTime = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	add_to_group("stars")

func starCounterZero():
	level.starCounter = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func reactivate():
	visible = true
	firstTime = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" and firstTime == true:
		visible = false
		firstTime = false
		level.starCounter += 1
		
