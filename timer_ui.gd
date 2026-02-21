extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_timer():
	$TimerDisplay.text = str(Global.task_length_input)
	$Timer.start()


func _on_timer_timeout() -> void:
	$TimerDisplay.text = str(int($TimerDisplay.text) - 1)
	if (int($TimerDisplay.text) == 0):
		$Timer.stop()
