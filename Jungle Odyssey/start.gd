extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_pressed():
	get_tree().change_scene_to_file("res://character_selection.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_return_pressed():
	print("restart")
	GameManager.reset()
	get_tree().change_scene_to_file("res://character_selection.tscn")
