extends ColorRect

@onready var buttons = $"../VBoxContainer"
@onready var isPauseMenuOpen = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.y = -1000
	buttons.position.y = -600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		togglePauseMenu(!isPauseMenuOpen) # sorry for bad naming convention here

func _on_resume_pressed() -> void:
	togglePauseMenu(!isPauseMenuOpen)
	
func togglePauseMenu(isOpening: bool) -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", 0 if isOpening else -1000, 0.5)
	
	var buttontween = create_tween()
	buttontween.set_trans(Tween.TRANS_SINE)
	buttontween.set_ease(Tween.EASE_OUT)
	buttontween.tween_property(buttons, "position:y", 0 if isOpening else -600, 0.75)
	
	Global.playerCanMove = false if isOpening else true
	isPauseMenuOpen = true if isOpening else false


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
