extends Area2D



func _ready():
	pass
	

func _on_area_entered(area):
	if area.is_in_group("player_kill_detect"):
		get_tree().change_scene_to_file("res://lose.tscn")

