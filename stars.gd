extends Area2D


var starCounter = 0

var firstTime = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true

func starCounterZero():
	starCounter = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		visible = false
		firstTime = false
		starCounter += 1
		
