extends Node2D

@onready var picture = %Picture
@onready var scream = $AudioStreamPlayer2D
func _ready():
	# Ensure the picture and sound are hidden/paused initially
	picture.visible = false
	scream.stop()

func _trigger_jumpscare():
	# Show the scary picture
	picture.visible = true
	$Timer.start()
	# Play the scream sound
	scream.play()

func _on_timer_timeout():
	picture.visible = false
	scream.stop()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):  # Make sure to add your player to the "player" group
		_trigger_jumpscare()
