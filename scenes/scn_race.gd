extends Node2D

onready var player = get_node('rb2d_car')
var velocity = Vector2(0, 0)

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_left'):
		player.move_local_x(delta - 8)
	elif Input.is_action_pressed('ui_right'):
		player.move_local_x(delta + 8)
	elif Input.is_action_pressed('ui_up'):
		player.move_local_y(delta - 8)
	elif Input.is_action_pressed('ui_down'):
		player.move_local_y(delta + 8)

func _physics_process(delta):
	var collide = player.move_and_collide(delta * velocity)
