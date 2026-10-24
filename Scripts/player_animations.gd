extends AnimatedSprite2D

@onready var player = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.is_on_floor() and not player.was_on_floor:
		self.play("Squash")
		# need to add a delay here so animation actually plays
		# a big reason why squash isnt playing is because the other animations are overriding it the next frame
		
	if self.is_playing() and self.animation == "Squash": return; # this is called a guard clause and i rlly like to use this so i hope you get used to seeing this :)))
	if player.direction == 0: 
		if player.is_on_floor():
			self.play("Idle")
		else: 
			self.play("Jump")
	else:
		self.play("Run")
		if player.direction > 0:
			self.flip_h = false
		elif player.direction < 0:
			self.flip_h = true
