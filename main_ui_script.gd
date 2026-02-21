extends CanvasLayer

@onready var username_input = $VBoxContainer/UsernameInput
@onready var task_length_input = $VBoxContainer/TaskLengthInput
@onready var calculate_button = $VBoxContainer/CalculateButton
@onready var level_label = $VBoxContainer/LevelLabel
@onready var tasks_left_label = $VBoxContainer/TasksLeftLabel

func _ready():
		print(calculate_button)
		calculate_button.pressed.connect(_on_calculate_pressed)
		
func _on_calculate_pressed():
	Global.username = username_input.text.strip_edges()

	if Global.username == "":
		level_label.text = "Please enter a username."
		return

	if not task_length_input.text.is_valid_int():
		level_label.text = "Please enter a valid number."
		return

	var task_length = int(task_length_input.text)
	var tasks_left = Global.tasks_total - Global.tasks_completed

	var tasks_completed_value = round(task_length * 0.333)
	var points = tasks_completed_value
	var next_level = 10.0

	while points >= next_level:
		Global.level += 1
		next_level *= 1.2

	level_label.text = Global.username + " is level " + str(Global.level) + "!"
	tasks_left_label.text = "Tasks left: " + str(tasks_left)
	
	get_node("VBoxContainer/NextButton").show()


func _on_next_button_pressed() -> void:
	get_node("VBoxContainer").hide()
