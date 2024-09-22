extends Node2D

var Player_1 = preload("res://player.tscn")
var new_Player = Player_1.instantiate()


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.PlayerSelect == 1:
		get_tree().current_scene.add_child(new_Player)
		new_Player.global_position = global_position
	elif GameManager.PlayerSelect == 2:
		print("IT WORKS!!!")

func _on_skip_tutorial_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
