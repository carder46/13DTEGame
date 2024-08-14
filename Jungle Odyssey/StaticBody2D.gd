extends Area2D
# Called when a body enters the ladder's area


func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.on_ladder = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		GameManager.on_ladder = false
