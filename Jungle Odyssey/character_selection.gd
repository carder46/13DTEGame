extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_1_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
	GameManager.PlayerSelect = 1


func _on_player_2_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
	GameManager.PlayerSelect = 2
