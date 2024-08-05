extends CanvasLayer

func _ready():
	#play reverse animation for 3 hearts
	$Heart1.play("health")
	$Heart2.play("health")
	$Heart3.play("health")
	$AnimationPlayer.play("RESET")
	GameManager.cipher_count = 0


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
					get_tree().paused = true
					$AnimationPlayer.play("fade")
					$QuitTimer.start()
			1:
				$Heart2.play_backwards("health")
				$damage.play()
				$lowhealth.play()
			2:
				$Heart3.play_backwards("health")
				$damage.play()

func _on_quit_timer_timeout():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://lose.tscn")
	
func add_health(amount):
	update_ui()
	GameManager.health+=amount

func win():
	if GameManager.cipher_count == 10:
		if $QuitTimer.is_stopped:
				get_tree().paused = true
				$AnimationPlayer.play("fade")
				$QuitTimer.start()
	
func update_ui():
	print("usdfsahfsdjkf")
	if GameManager.health > 3:
		GameManager.health = 3
	match GameManager.health:
		1:
			$Heart2.play("health")
		2:
			$Heart3.play("health")
		3:
			return
			


