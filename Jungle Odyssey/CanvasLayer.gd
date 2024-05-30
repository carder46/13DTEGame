extends CanvasLayer

func _ready():
	#play reverse animation for 3 hearts
	$Heart1.play("health")
	$Heart2.play("health")
	$Heart3.play("health")


### pages_collected += 1
			# collection_tracker.text = "Parts Collected : " + str(pages_collected) + " / 10"
			# if pages_collected == 10:
			# 	get_tree().change_scene_to_file("res://WinScene.tscn")

func damage(amount):
	if GameManager.health >= amount:
		GameManager.health -= amount
		match GameManager.health:
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
	get_tree().change_scene_to_file("res://lose.tscn")

func health(amount):
	GameManager.health -= amount
	if GameManager.health > 3:
		GameManager.health = 3
	match GameManager.health:
		1:
			$Heart2.play("health")
		2:
			$Heart3.play("health")
		3:
			return
