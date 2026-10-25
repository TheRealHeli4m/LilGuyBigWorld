extends AnimatedSprite2D

@onready var player = $".."
var isJumping: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Global.playerCanMove: return
	
	if not player.is_on_floor():
		isJumping = true
	else:
		isJumping = false

	if isJumping:
		self.play("Jump")
		if self.frame == 4:
			self.pause()
		
		return
		
	if player.direction == 0:
		if player.is_on_floor():
			self.play("Idle")
	else:
		self.play("Run")
		if player.direction > 0:
			self.flip_h = false
		elif player.direction < 0:
			self.flip_h = true
