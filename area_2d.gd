extends Area2D

@onready var anim: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var animationPlayer: AnimationPlayer = $"../AnimationPlayer"


# Erlaube Schaden nur bei diesen Animationsframes


func _ready() -> void:
	anim.play("default")
	animationPlayer.play("puch")



func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().call_group("hearts", "damage", 20)
