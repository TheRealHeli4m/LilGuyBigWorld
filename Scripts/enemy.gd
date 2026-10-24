extends Node2D

const SPEED = 60
var DIRECTION = 1

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		DIRECTION = -1
		animated_sprite.flip_h = true
	if ray_cast_right.is_colliding():
		DIRECTION = 1
		animated_sprite.flip_h = false
	
	postition.x += DIRECTION * SPEED * delta
