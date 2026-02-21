extends Node2D

@onready var username_input = $MainUI/VBoxContainer2/UsernameInput
@onready var task_length_input = $MainUI/VBoxContainer2/TaskLengthInput
@onready var calculate_button = $MainUI/VBoxContainer2/CalculateButton
@onready var level_label = $MainUI/VBoxContainer2/LevelLabel
@onready var tasks_left_label = $MainUI/VBoxContainer2/TasksLeftLabel

var tasks_completed = 2
var tasks_total = 10

func _ready():
	print(calculate_button)
	calculate_button.pressed.connect(_on_calculate_pressed)
	
	print(get_tree_string())
	

	var calculate_button = get_node("MainUI/VBoxContainer2/CalculateButton") 
	calculate_button.pressed.connect(_on_calculate_pressed)
func _on_calculate_pressed():
	var username = username_input.text.strip_edges()

	if username == "":
		level_label.text = "Please enter a username."
		return

	if not task_length_input.text.is_valid_int():
		level_label.text = "Please enter a valid number."
		return

	var task_length = int(task_length_input.text)
	var tasks_left = tasks_total - tasks_completed

	var level = 0
	var tasks_completed_value = round(task_length * 0.333)
	var points = tasks_completed_value
	var next_level = 10.0

	while points >= next_level:
		level += 1
		next_level *= 1.2

	level_label.text = username + " is level " + str(level) + "!"
	tasks_left_label.text = "Tasks left: " + str(tasks_left)
	if level > 0 and level % 5 == 0 :
		level_label.add_theme_color_override("font_color",Color.GOLDENROD)
	else:
		level_label.add_theme_color_override("font_color",Color.AQUA)
		
