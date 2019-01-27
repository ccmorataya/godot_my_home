extends Node2D

onready var rigid_player = get_node('rb2d_car')
onready var vehicle = rigid_player.get_node("rtl_car")
onready var message = get_node('lbl_message')
onready var bg = get_node("spr_background")
onready var sb2d = StaticBody2D.new()
onready var cs2d = CollisionShape2D.new()
onready var rs2d = RectangleShape2D.new()
var velocity = Vector2(0, 0)
var colliding = false

func _ready():
	collision_instance()
	vehicle.add_color_override('default_color', '#f00')
	if globals.vehicle_type == 0:
		vehicle.text = 'vampire'
	elif globals.vehicle_type == 1:
		vehicle.text = 'snooper'
	elif globals.vehicle_type == 2:
		vehicle.text = 'speed'

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var life_counter = get_node("lbl_life_counter")
	life_counter.text = str(globals.player_life)
	if Input.is_action_pressed("ui_accept"):
		colliding = false
		message.hide()
	if !colliding:
		if Input.is_action_pressed('ui_left'):
			rigid_player.move_local_x(delta - 8)
		elif Input.is_action_pressed('ui_right'):
			rigid_player.move_local_x(delta + 8)
		elif Input.is_action_pressed('ui_up'):
			rigid_player.move_local_y(delta - 8)
		elif Input.is_action_pressed('ui_down'):
			rigid_player.move_local_y(delta + 8)
		bg.move_local_y(delta + 1)
		sb2d.move_local_y(delta + 1)
		if bg.position.y >= 1024 && globals.player_life > 0:
			print('you win')

func _physics_process(delta):
	var player_collision = rigid_player.move_and_collide(delta * velocity)
	if player_collision:
		globals.player_life -= 10
		rigid_player.set_position(Vector2(rigid_player.position.x, rigid_player.position.y)) # = Vector2(500, 480)
		colliding = true
		message.show()

func collision_instance():
		rs2d.set_extents(Vector2(32, 32))
		cs2d.set_shape(rs2d)
		sb2d.add_child(cs2d)
		get_node(".").add_child(sb2d)
		sb2d.position.x = 500