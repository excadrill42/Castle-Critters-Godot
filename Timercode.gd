extends Timer

func _ready() -> void:
	timeout.connect(_on_timer_finished)

func start_from_input(seconds: int):
	start(seconds)

func _on_timer_finished():
	print("Timer finished!")
