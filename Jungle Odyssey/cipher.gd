extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func collected():
	var vanish = preload("res://vanish.tscn")
	var new_vanish_object = vanish.instantiate()
	get_tree().current_scene.add_child(new_vanish_object)
	new_vanish_object.global_position = global_position


func _on_area_entered(area):
	if area.is_in_group("player"):
		collected()
		queue_free()
		GameManager.cipher_count += 1
		print(GameManager.cipher_count)
	if GameManager.cipher_count == 5:
		get_tree().change_scene_to_file("res://win.tscn")

