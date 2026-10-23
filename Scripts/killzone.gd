extends Area2D

@onready var timer = $Timer

# this will trigger the timer when the character enters the 'killzone', aka enemies or falling into the void
func _on_body_entered(body: Node2D) -> void:
	# slows down time before reset for dramatic effects
	Engine.time_scale = 0.5
	timer.start()

# this will reset the scene when the timer runs out

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
