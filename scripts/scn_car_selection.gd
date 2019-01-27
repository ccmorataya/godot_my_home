extends Node2D

onready var btn_default = get_node('hbc_car_selection/btn_snooper_hunter')

# Called when the node enters the scene tree for the first time.
func _ready():
	
	btn_default.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_vampiremobil_pressed():
	globals.vehicle_type = 0
	get_tree().change_scene('res://scenes/scn_race.tscn')


func _on_btn_snooper_hunter_pressed():
	globals.vehicle_type = 1
	get_tree().change_scene('res://scenes/scn_race.tscn')


func _on_btn_speed_runner_pressed():
	globals.vehicle_type = 2
	get_tree().change_scene('res://scenes/scn_race.tscn')
