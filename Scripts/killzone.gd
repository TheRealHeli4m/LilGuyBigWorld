extends StaticBody2D

@onready var timer: Timer = $Timer

# this will trigger the timer when the character enters the 'killzone', aka enemies or falling into the void
func _on_body_entered(body) -> void:
	# slows down time before reset for dramatic effects
	Engine.time_scale = 0.5
	# plays times
	timer.start()

# this will reset the scene when the timer runs out
func _on_timer_timeout() -> void:
	#resets scene
	get_tree().reload_current_scene()
	# resets time to normal
	Engine.time_scale = 1
