extends TextureButton

var current_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	if current_tween and current_tween.is_running():
		current_tween.kill()
	
	current_tween = create_tween()
	current_tween.set_trans(Tween.TRANS_BACK)
	current_tween.set_ease(Tween.EASE_OUT)
	
	current_tween.tween_property(self, "scale", Vector2(9, 9), 0.3)


func _on_mouse_exited() -> void:
	if current_tween and current_tween.is_running():
		current_tween.kill()
		
	current_tween = create_tween()
	current_tween.set_trans(Tween.TRANS_CUBIC)
	current_tween.set_ease(Tween.EASE_OUT)
	
	current_tween.tween_property(self, "scale", Vector2(8, 8), 0.3)
