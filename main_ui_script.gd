extends CanvasLayer

@onready var username_input = $VBoxContainer/UsernameInput
@onready var calculate_button = $VBoxContainer/CalculateButton
@onready var level_label = $VBoxContainer/LevelLabel
@onready var username_on = true
@onready var timer_overlay = $"../Node"



func _ready():
		print(calculate_button)
		calculate_button.pressed.connect(_on_calculate_pressed)
		$NewTaskButton.hide()
		if (username_on == false):
			$VBoxContainer/UsernameInput.hide()

func _on_start_pressed():
	var minutes = int($VBoxContainer/TaskLengthInput.text)
	timer_overlay.start_timer(minutes)
	
func _on_calculate_pressed():
	if (username_on == true):
		Global.username = username_input.text.strip_edges()
	
	if Global.username == "":
		level_label.text = "Please enter a username."
		return

	if not $VBoxContainer/TaskLengthInput.text.is_valid_int():
		level_label.text = "Please enter a valid number."
		return
	
	if ($VBoxContainer/TaskNameInput.text.length() > 20):
		level_label.text = "Please enter a task name less than 20 characters."
		return
	
	var minutes = int($VBoxContainer/TaskLengthInput.text)
		
	if minutes <= 0:
		minutes = 1
	
	Global.task_length_input = minutes
	_on_start_pressed()
	
	Global.task_length_input = int($VBoxContainer/TaskLengthInput.text)
	Global.task_name = $VBoxContainer/TaskNameInput.text
	$"../Node/TimerBar".max_value = Global.task_length_input * 60

	level_label.text = Global.username + " is level " + str(Global.level) + "!"
	
	username_on = false
	
	get_node("VBoxContainer/NextButton").show()
	get_node("VBoxContainer/CalculateButton").hide()
	$Username.text = Global.username



func _on_next_button_pressed() -> void:
	get_node("VBoxContainer").hide()


func _on_new_task_button_pressed() -> void:
	$VBoxContainer.show()
	calculate_button.show()
	username_input.hide()
	$NewTaskButton.hide()
	$VBoxContainer/NextButton.hide()
	$VBoxContainer/TaskLengthInput.text = ""
	$VBoxContainer/TaskNameInput.text = ""
	$VBoxContainer/LevelLabel.text = ""
