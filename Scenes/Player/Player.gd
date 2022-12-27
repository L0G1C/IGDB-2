extends KinematicBody2D

var Velocity = Vector2.ZERO
const ACCELERATION = 550
const MAX_SPEED = 100;
const FRICTION = 450;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	inputVector.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	inputVector = inputVector.normalized()
	
	if (inputVector != Vector2.ZERO):
		#_animState.travel("Walk")
		Velocity = Velocity.move_toward(inputVector * MAX_SPEED, ACCELERATION * delta)
		
		if (inputVector.x < 0):
			$Sprite.flip_h = true
		elif (inputVector.x >= 0):
			$Sprite.flip_h = false

	else:
		Velocity = Velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		#_animState.travel("Idle")
		
	Velocity = move_and_slide(Velocity)
