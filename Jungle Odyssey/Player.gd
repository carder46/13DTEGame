extends CharacterBody2D

@export var SPEED = 250.0
@export var JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction : Vector2 = Vector2.ZERO
var swing : bool = false

@onready var animation_tree = $AnimationTree

func set_jumping(val):
	animation_tree["parameters/conditions/is_jumping"] = val
	animation_tree["parameters/conditions/is_falling"] = not val
	animation_tree["parameters/conditions/is_running"] = false
	animation_tree["parameters/conditions/idle"] = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			set_running(true)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			set_running(false)
		
		
	if velocity.y < 0:
		set_jumping(true)
	elif velocity.y > 0:
		set_jumping(false)	

	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("Right"):
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("Left"):
		$AnimatedSprite2D.flip_h = true

func set_running(val):
	animation_tree["parameters/conditions/is_running"] = val
	animation_tree["parameters/conditions/idle"] = not val
	animation_tree["parameters/conditions/is_jumping"] = false
	animation_tree["parameters/conditions/is_falling"] = false


