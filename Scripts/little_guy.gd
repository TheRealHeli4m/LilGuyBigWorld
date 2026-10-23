extends CharacterBody2D

@onready var coyoteTimer = $CoyoteTimer
@onready var jBuffTimer = $JumpBuffering
@onready var jumpTimer = $JumpHeightTimer
@onready var leftOutRC = $LeftOuterRC
@onready var rightOutRC = $RightOuterRC
@onready var leftInRC = $LeftInnerRC
@onready var rightInRC = $RightInnerRC

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var was_on_floor: bool
var canJump: bool

# i think there MIGHT be something redundant in here but it works so im not gonna fix it for now
func _physics_process(delta: float) -> void:	
	if is_on_floor(): canJump = true 
	if not is_on_floor(): 
		velocity += get_gravity() * delta # gravity
		canJump = false
	
	if was_on_floor and !is_on_floor() and velocity.y > 0: 
		coyoteTimer.start()
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and !canJump:
		jBuffTimer.start()

	if (Input.is_action_just_pressed("jump") or !jBuffTimer.is_stopped()) and (canJump or !coyoteTimer.is_stopped()):
		jumpTimer.start()
		velocity.y = JUMP_VELOCITY
		canJump = false
		coyoteTimer.stop()
		
	if jumpTimer.is_stopped() and !Input.is_action_pressed("jump"):
		if velocity.y < 0:
			velocity.y *= 0.75
			
	if leftOutRC.is_colliding() and !leftInRC.is_colliding() and !rightInRC.is_colliding() and !rightOutRC.is_colliding():
		self.global_position.x += 5
	if !leftOutRC.is_colliding() and !leftInRC.is_colliding() and !rightInRC.is_colliding() and rightOutRC.is_colliding():
		self.global_position.x -= 5

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	was_on_floor = is_on_floor()
	if Global.playerCanMove: # check out global.gd 
		move_and_slide()
