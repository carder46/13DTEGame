extends Node2D

@onready var picture = %Picture
@onready var slip = $AudioStreamPlayer2D
@onready var getout = $"GETOUT!"

func _ready():
	# Ensure the picture and sound are hidden/paused initially
	picture.visible = false
	slip.stop()
	getout.stop()

func _trigger_jumpscare():
	# Show the scary picture
	picture.visible = true
	$Timer.start()
	# Play the scream sound
	slip.play()
	getout.play()
	get_tree().paused = true

func _on_timer_timeout():
	picture.visible = false
	slip.stop()
	getout.stop()
	get_tree().paused = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):  # Make sure to add your player to the "player" group
		_trigger_jumpscare()
