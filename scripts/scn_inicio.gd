extends Node2D

onready var lbl_run_home = get_node("rch_lbl_run_home")
onready var lbl_press_enter = get_node("lbl_press_enter")
onready var change_scene = false

func _ready():
	lbl_run_home.add_color_override("default_color", '#00FF00')
	var initial_text = '17:00 ... begin the race to home'
	printText(initial_text, lbl_run_home)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept") && change_scene:
		get_tree().change_scene("res://scenes/scn_car_selection.tscn")

func printText(text, label):
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.05)
	t.set_one_shot(true)
	self.add_child(t)
	for letter in text:
		t.start()
		label.add_text(letter)
		yield(t, "timeout")
	change_scene = true
	lbl_press_enter.show()