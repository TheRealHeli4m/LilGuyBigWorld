extends CharacterBody2D

# these two constants are for an idea to try where as our little guy gets bigger, his velocity decreases
const FORCE = 300
const MASS = 1

const SPEED = FORCE/MASS
const JUMP_VELOCITY = -FORCE/MASS

@onready var animated_sprite = $AnimatedSprite2D

# this will be used to squash our character when they hit a surface
var was_in_air = false

func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		was_in_air = true
		velocity += get_gravity() * delta
		
	if is_on_floor():
		if was_in_air:
			animated_sprite.play("Squash")
			# need to add a delay here so animation actually plays
			was_in_air = false
		else:
			pass	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction == 0:
		if is_on_floor():
			animated_sprite.play("idle")
		else:
			animated_sprite.play("Jump")
	else:
		animated_sprite.play("Run")
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
