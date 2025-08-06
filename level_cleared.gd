extends Panel

@onready var display: TextureRect = $TextureRect
@onready var stars: Area2D = $"../../stars"

@onready var star0 = preload("res://assets/star0.png")
@onready var star1 = preload("res://assets/star1.png")
@onready var star2 = preload("res://assets/star2.png")
@onready var star3 = preload("res://assets/star3.png")

var countTheStars = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

func clear():
	visible = true
	countTheStars = stars.starCounter
	print(countTheStars)
	match countTheStars:
		0:
			display.texture = star0
		1:
			display.texture = star1
		2:
			display.texture = star2
		3:
			display.texture = star3
	get_tree().paused = true



func _on_button_pressed() -> void:
	visible = false
	get_tree().paused = false
	
