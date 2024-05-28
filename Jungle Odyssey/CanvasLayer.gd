extends CanvasLayer
@onready var health = 3

func _ready():
	#play reverse animation for 3 hearts
	$Heart1.play("health")
	$Heart2.play("health")
	$Heart3.play("health")


func _process(delta):
	pass

func damage(amount):
	if health >= amount:
		health -= amount
		match health:
			0:
				$Heart1.play_backwards("health")
				$damage.play()
				if $QuitTimer.is_stopped:
					$QuitTimer.start()
			1:
				$Heart2.play_backwards("health")
				$damage.play()
				$lowhealth.play()
			2:
				$Heart3.play_backwards("health")
				$damage.play()

func _on_quit_timer_timeout():
	get_tree().quit()
