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
	if not is_on_floor() and !GameManager.on_ladder:
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


	if GameManager.on_ladder:
		if Input.is_action_pressed("Down"):
			velocity.y = SPEED*delta*10
		elif Input.is_action_pressed("Up"):
			velocity.y = -SPEED*delta*10
		else:
			velocity.y = 0

	move_and_slide()


func _process(delta):
	if Input.is_action_pressed("Right"):
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("Left"):
		$AnimatedSprite2D.flip_h = true
	var velocity = Vector2.ZERO
	
	if Input.is_action_just_pressed("Restart"):
		set_process(false)
		set_physics_process(false)
		hide()
		if $ResetTimer.is_stopped():
			var reset = preload("res://reset.tscn")
			var new_reset_object = reset.instantiate()
			get_tree().current_scene.add_child(new_reset_object)
			new_reset_object.global_position = global_position
			$ResetTimer.start()

func set_running(val):
	animation_tree["parameters/conditions/is_running"] = val
	animation_tree["parameters/conditions/idle"] = not val
	animation_tree["parameters/conditions/is_jumping"] = false
	animation_tree["parameters/conditions/is_falling"] = false


func _on_reset_timer_timeout():
	get_tree().reload_current_scene()
