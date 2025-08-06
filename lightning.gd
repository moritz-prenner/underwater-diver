extends Area2D

@onready var anim: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D


@onready var shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	animation_player.play("move-lightning")
	anim.play("default")



func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		get_tree().call_group("hearts", "damage", 20)
