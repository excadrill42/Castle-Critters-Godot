extends CanvasLayer

var current_xp = 0
var xp_needed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_update_label")
	$ProgressBar.max_value = xp_needed

func _update_label() -> void:
	$Label.text = "Level: " + str(Global.level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label2.text = "Current Task: " + Global.task_name

func task_completed():
	current_xp += Global.task_length_input
	Global.task_length_input = 0
	if (current_xp >= xp_needed):
		level_up()
	else:
		$ProgressBar.value = current_xp

func level_up():
	Global.level += current_xp / xp_needed
	if (Global.level > 0):
		Global.level_1()
	if (Global.level > 1):
		Global.level_2()
	current_xp = current_xp % xp_needed
	$Label.text = "Level: " + str(Global.level)
	$ProgressBar.value = current_xp

func _on_example_pressed() -> void:
	task_completed()
	$Example.hide()
	$"../MainUI"._on_new_task_button_pressed()
