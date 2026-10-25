extends Camera2D

@onready var player = $".."
var look_ahead_distance = 60.0
var look_ahead_speed = 5.0
var commit_speed = 10.0

var current_look_ahead = Vector2.ZERO

func _physics_process(delta: float) -> void:
	self.offset.y = -200
	if not player:
		return

	var velocity = player.velocity
	var target_look_ahead = Vector2.ZERO

	if velocity.length() > commit_speed:
		target_look_ahead = velocity.normalized() * look_ahead_distance

	var weight = 1.0 - exp(-look_ahead_speed * delta)
	current_look_ahead = current_look_ahead.lerp(target_look_ahead, weight)


	global_position = player.global_position + current_look_ahead
