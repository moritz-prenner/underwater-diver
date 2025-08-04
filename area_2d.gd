extends Area2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var hearts: ProgressBar = $UI/ProgressBar2
@onready var player: CharacterBody2D = $CharacterBody2D

var hitPossible = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	while 0 < 10:
		await get_tree().create_timer(2.0).timeout
		hitPossible = true
		await get_tree().create_timer(2.0).timeout
		hitPossible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body == player and hitPossible == true:
		hearts.damage(20)
