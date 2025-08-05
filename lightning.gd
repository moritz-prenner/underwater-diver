extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hearts: ProgressBar = $"../UI/ProgressBar2"

@onready var shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	anim.play("default")
	shape.position.x += 1000000
	await get_tree().create_timer(0.6).timeout
	while 0 < 10:
		shape.position.x -= 1000000
		await get_tree().create_timer(2.8).timeout
		shape.position.x += 1000000
		await get_tree().create_timer(1.4).timeout


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		hearts.damage(20)
