extends Node

@onready var level_cleared: Panel = $"../UI/LevelCleared"
@onready var gameOver: Panel = $"../UI/GameOver"

func touched():
	level_cleared.clear()
	gameOver.checkpoint += 1
	print("checkpoint:")
	print(gameOver.checkpoint)
