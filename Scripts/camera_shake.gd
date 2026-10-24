extends Node2D

var shakeIntensity= 0.0
var activeShakeTime = 0.0

var shakeDecay = 5.0

var shakeTime = 0.0
var shakeTimeSpeed = 20.0

var noise = FastNoiseLite.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if activeShakeTime > 0:
		shakeTime += delta * shakeTimeSpeed
		activeShakeTime -= delta
		
		position = Vector2(
			noise.get_noise_2d(shakeTime, 0) * shakeIntensity,
			noise.get_noise_2d(0, shakeTime) * shakeIntensity
		)
		
		shakeIntensity = max(shakeIntensity - shakeDecay * delta, 0)
		
	else:
		position = lerp(position, Vector2.ZERO, 10.5 * delta)

func screenShake(intensity: int, time: float):
	randomize() # have to call randomize or else the seed is going to be the same every time (?)
	noise.seed = randi()
	noise.frequency = 2.0
	
	shakeIntensity = intensity
	activeShakeTime = time
	shakeTime = 0.0
