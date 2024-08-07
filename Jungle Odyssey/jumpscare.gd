extends Node2D
@export var picture: Picture
@export var scream: AudioStreamPlayer2D

func _ready():
	# Ensure the picture and sound are hidden/paused initially
	picture.visible = false
	scream.stop()

func _on_Area2D_body_entered(body):
	# Check if the body is the player
	if body.is_in_group("player"):  # Make sure to add your player to the "player" group
		_trigger_jumpscare()

func _trigger_jumpscare():
	# Show the scary picture
	picture.visible = true
	
	# Play the scream sound
	scream.play()

func _on_timer_timeout():
	picture.visible = false
	scream.stop()
