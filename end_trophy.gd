extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var endMessage: Panel = $UI/endMessage


func _ready() -> void:
	anim.play("default")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		anim.play("pressed")
		
		get_tree().paused = true
		endMessage.visible = true
