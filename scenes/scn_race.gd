extends Node2D

onready var rigid_player = get_node('rb2d_car')
onready var vehicle = rigid_player.get_node("rtl_car")
var velocity = Vector2(0, 0)

func _ready():
	vehicle.add_color_override('default_color', '#f00')
	if globals.vehicle_type == 0:
		vehicle.text = 'vampire'
	elif globals.vehicle_type == 1:
		vehicle.text = 'snooper'
	elif globals.vehicle_type == 2:
		vehicle.text = 'speed'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_left'):
		rigid_player.move_local_x(delta - 8)
	elif Input.is_action_pressed('ui_right'):
		rigid_player.move_local_x(delta + 8)
	elif Input.is_action_pressed('ui_up'):
		rigid_player.move_local_y(delta - 8)
	elif Input.is_action_pressed('ui_down'):
		rigid_player.move_local_y(delta + 8)

func _physics_process(delta):
	rigid_player.move_and_collide(delta * velocity)
