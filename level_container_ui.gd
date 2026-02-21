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
	pass

func task_completed():
	current_xp += Global.task_length_input
	if (current_xp >= xp_needed):
		level_up()
	else:
		$ProgressBar.value = current_xp

func level_up():
	Global.level += current_xp / xp_needed
	current_xp = current_xp % xp_needed
	$Label.text = "Level: " + str(Global.level)
	$ProgressBar.value = current_xp

func _on_example_pressed() -> void:
	task_completed()
