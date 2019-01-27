extends Node2D

onready var btn_default = get_node('hbc_car_selection/btn_the_hunter')

# Called when the node enters the scene tree for the first time.
func _ready():
	btn_default.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
