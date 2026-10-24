extends CharacterBody2D

<<<<<<< HEAD
# these two constants are for an idea to try where as our little guy gets bigger, his velocity decreases
const FORCE = 300
const MASS = 1

const SPEED = FORCE/MASS
const JUMP_VELOCITY = -FORCE/MASS

@onready var animated_sprite = $AnimatedSprite2D
@onready var coyoteTimer = $CoyoteTimer
@onready var jBuffTimer = $JumpBuffering
@onready var jumpTimer = $JumpHeightTimer
@onready var leftOutRC = $LeftOuterRC
@onready var rightOutRC = $RightOuterRC
@onready var leftInRC = $LeftInnerRC
@onready var rightInRC = $RightInnerRC

var was_on_floor: bool
var canJump: bool
# this will be used to squash our character when they hit a surface
var was_in_air = false

# i think there MIGHT be something redundant in here but it works so im not gonna fix it for now
func _physics_process(delta: float) -> void:	
	if is_on_floor(): 
		canJump = true 
		if was_in_air:
			animated_sprite.play("Squash")
			was_in_air = false
	if not is_on_floor(): 
		velocity += get_gravity() * delta # gravity
		canJump = false
		was_in_air = true
	
	if was_on_floor and !is_on_floor() and velocity.y > 0: 
		coyoteTimer.start()
		
	if Input.is_action_just_pressed("jump") and not is_on_floor() and !canJump:
		jBuffTimer.start()

	if (Input.is_action_just_pressed("jump") or !jBuffTimer.is_stopped()) and (canJump or !coyoteTimer.is_stopped()):
		jumpTimer.start()
		velocity.y = JUMP_VELOCITY
		canJump = false
		coyoteTimer.stop()
>>>>>>> d965f558583768c1a57d15cb75a924a40aaa6bfe
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

<<<<<<< HEAD
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		if is_on_floor():
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Jump")
	else:
		animated_sprite.play("Run")
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
	
=======
	var direction := Input.get_axis("move_left", "move_right")
>>>>>>> d965f558583768c1a57d15cb75a924a40aaa6bfe
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	was_on_floor = is_on_floor()
	if Global.playerCanMove: # check out global.gd 
		move_and_slide()
