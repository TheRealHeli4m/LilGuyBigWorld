extends ColorRect

@onready var buttons = $"../VBoxContainer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.y = -1000
	buttons.position.y = -600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		var tween = create_tween()
		tween.tween_property(self, "position:y", 0, 0.5)
		
		var buttontween = create_tween()
		buttontween.set_trans(Tween.TRANS_SINE)
		buttontween.set_ease(Tween.EASE_OUT)
		buttontween.tween_property(buttons, "position:y", 0, 0.75)
		
		Global.playerCanMove = false


func _on_resume_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", -1000, 0.5)
	
	var buttontween = create_tween()
	buttontween.set_trans(Tween.TRANS_SINE)
	buttontween.set_ease(Tween.EASE_OUT)
	buttontween.tween_property(buttons, "position:y", -600, 0.75)
	
	Global.playerCanMove = true
