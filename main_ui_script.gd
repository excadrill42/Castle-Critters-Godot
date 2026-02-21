extends CanvasLayer

@onready var username_input = $VBoxContainer/UsernameInput
@onready var calculate_button = $VBoxContainer/CalculateButton
@onready var level_label = $VBoxContainer/LevelLabel
@onready var tasks_left_label = $VBoxContainer/TasksLeftLabel
@onready var username_on = true

func _ready():
		print(calculate_button)
		calculate_button.pressed.connect(_on_calculate_pressed)
		$NewTaskButton.hide()
		if (username_on == false):
			$VBoxContainer/UsernameInput.hide()

func _on_calculate_pressed():
	if (username_on == true):
		Global.username = username_input.text.strip_edges()

		if Global.username == "":
			level_label.text = "Please enter a username."
			return


	if not $VBoxContainer/TaskLengthInput.text.is_valid_int():
		level_label.text = "Please enter a valid number."
		return

	
	Global.task_length_input = int($VBoxContainer/TaskLengthInput.text)

	level_label.text = Global.username + " is level " + str(Global.level) + "!"
	
	username_on = false
	
	get_node("VBoxContainer/NextButton").show()
	get_node("VBoxContainer/CalculateButton").hide()



func _on_next_button_pressed() -> void:
	get_node("VBoxContainer").hide()
	$NewTaskButton.show()


func _on_new_task_button_pressed() -> void:
	$VBoxContainer.show()
	calculate_button.show()
	username_input.hide()
	$NewTaskButton.hide()
	$VBoxContainer/NextButton.hide()
	$VBoxContainer/TaskLengthInput.text = ""
	$VBoxContainer/TaskNameInput.text = ""
	$VBoxContainer/LevelLabel.text = "Level will appear here."
