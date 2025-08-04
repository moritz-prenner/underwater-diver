extends Path2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("swim")
	swim()

func swim():
	while 0 < 10:
		await get_tree().create_timer(4.0).timeout
		animated_sprite_2d.play("default2")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
