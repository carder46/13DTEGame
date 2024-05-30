extends Area2D
@onready var UI = get_tree().get_first_node_in_group('UI')

func collected():
	var vanish = preload("res://vanish.tscn")
	var new_vanish_object = vanish.instantiate()
	get_tree().current_scene.add_child(new_vanish_object)
	new_vanish_object.global_position = global_position


func _on_area_entered(area):
	if GameManager.health == 3:
		return
	if area.is_in_group("player"):
		collected()
		queue_free()
		GameManager.health += 1
		print(GameManager.health)
		UI.health(1)

