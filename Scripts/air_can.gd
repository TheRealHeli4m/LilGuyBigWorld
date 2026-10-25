extends Area2D

@onready var little_guy: CharacterBody2D = $"../LittleGuy"

func _on_body_entered(body: Node2D) -> void:
	little_guy.air_can()
	queue_free()
