extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
		

