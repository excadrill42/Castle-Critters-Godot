extends CanvasLayer


@onready var input_field = $Panel/VBoxContainer/LineEdit
@onready var add_button = $Panel/VBoxContainer/Button
@onready var task_list = $Panel/VBoxContainer/ScrollContainer/VBoxContainer

func _ready():
	add_button.pressed.connect(add_task)

func add_task():
	var text = input_field.text.strip_edges()

	if text == "":
		return

	var checkbox = CheckBox.new()
	checkbox.text = text
	task_list.add_child(checkbox)

	input_field.text = ""
