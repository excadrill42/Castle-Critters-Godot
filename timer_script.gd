extends Control

@onready var timer = $CountdownTimer
@onready var time_label = $TimeLabel

var minutes
var points = 1
var points_to_be

func _ready():
	minutes = Global.task_length_input  # must be a number, not a node

	if minutes <= 0:
		minutes = 1

	points_to_be = round(minutes * 0.333)

	timer.one_shot = true
	timer.timeout.connect(_on_timer_finished)
	timer.start(minutes * 60)

func _process(delta):
	if not timer.is_stopped():
		var total_seconds = int(timer.time_left)
		var mins = total_seconds / 60
		var secs = total_seconds % 60
		time_label.text = "%02d:%02d" % [mins, secs]

func _on_timer_finished():
	points += points_to_be
	time_label.text = "Done!"
	print("Points:", points)
