extends CanvasLayer

var current_xp = 0.0
var xp_needed = 5.0

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
	pass
