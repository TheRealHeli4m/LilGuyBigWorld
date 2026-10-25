extends Node2D

@onready var colRect = $CanvasLayer/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	colRect.modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

 
func _on_button_pressed() -> void:
	var tween = create_tween()
	
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
