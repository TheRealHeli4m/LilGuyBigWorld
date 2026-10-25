extends Node2D

@onready var animPlayer = $CanvasLayer/AnimationPlayer
@onready var colRect = $CanvasLayer/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	colRect.color = Color(0, 0, 0, 1)
	animPlayer.play("fade_out")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
