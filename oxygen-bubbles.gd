extends Area2D

@onready var character_body_2d: CharacterBody2D = $"../../CharacterBody2D"
@onready var progress_bar: ProgressBar = $"../../UI/ProgressBar"

var startPos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	startPos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reactivate():
	position = startPos
	
func deactivate():
	position.x = position.x + 1000000
	visible = false
	
func _on_body_entered(body: Node2D) -> void:
	if body == character_body_2d:
		progress_bar.newOxygen(15)
		deactivate()
