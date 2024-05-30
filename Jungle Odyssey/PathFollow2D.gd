extends PathFollow2D
@onready var animated_sprite_2d = $Area2D/AnimatedSprite2D
@onready var UI = get_tree().get_first_node_in_group('UI')
var previous_x 
# Called when the node enters the scene tree for the first time.
func _ready():
	previous_x = global_position.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += 1
	if global_position.x < previous_x:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
	
	
	previous_x = global_position.x
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("player_kill_detect"):
		UI.damage(1)
