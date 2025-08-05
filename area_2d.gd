extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hearts: ProgressBar = $"../UI/ProgressBar2"


# Erlaube Schaden nur bei diesen Animationsframes
var damage_frames = [11, 12, 13, 14, 15] 
var hitPossible = false

func _ready() -> void:
	anim.play("default")

func _process(delta: float) -> void:
	# Prüfe jedes Frame, ob aktueller Frame in damage_frames enthalten ist
	hitPossible = anim.frame in damage_frames

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D" and hitPossible:
		hearts.damage(20)
