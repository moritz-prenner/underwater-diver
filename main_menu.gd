extends Node

@onready var options: Panel = $CanvasLayer/Panel/Panel2
@onready var panel: Panel = $CanvasLayer/Panel/Panel
@onready var credits: Panel = $CanvasLayer/Panel/Panel3
@onready var panel_4: Panel = $CanvasLayer/Panel/Panel4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	options.visible = false
	credits.visible = false

func _on_button_pressed() -> void:
	panel_4.visible = true


func _on_button_2_pressed() -> void:
	panel.visible = false
	options.visible = true
	


func _on_button_4_pressed() -> void:
	options.visible = false
	panel.visible = true


func _on_button_5_pressed() -> void:
	credits.visible = false
	panel.visible = true


func _on_button_3_pressed() -> void:
	credits.visible = true
	panel.visible = false
