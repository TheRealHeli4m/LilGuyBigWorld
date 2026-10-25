extends Node2D

@onready var colRect = $CanvasLayer/ColorRect
@onready var animPlayer = $CanvasLayer/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	colRect.color = Color(0, 0, 0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	animPlayer.play("fade_in")
	colRect.move_to_front()
	Global.playerCanMove = true
	
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
