extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var firstTime = true

func _ready() -> void:
	anim.play("default")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" and firstTime == true:
		get_tree().call_group("end", "gameEnded")
		anim.play("pressed")
		firstTime = false
		
