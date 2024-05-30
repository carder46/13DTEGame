extends Area2D

@onready var UI = get_tree().get_first_node_in_group('UI')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_area_entered(area):
	if area.is_in_group("player_kill_detect"):
		UI.damage(1)
