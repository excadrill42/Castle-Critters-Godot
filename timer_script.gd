extends Control

@onready var timer = $CountdownTimer
@onready var time_label = $TimeLabel

var task_length
var tasks_completed_value
var points_to_be
var points = 1

func _ready():
	task_length = 5
	
	if task_length <= 0:
		task_length = 5
	
	timer.timeout.connect(_on_timer_finished)
	timer.start(task_length)

func _process(delta):
	if not timer.is_stopped():
		time_label.text = str(ceil(timer.time_left))

	tasks_completed_value = round(task_length * 0.333)
	points_to_be = tasks_completed_value



func _on_timer_finished():
	points += points_to_be
	print("Points:", points)
