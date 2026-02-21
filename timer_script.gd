extends Control

@onready var timer = $CountdownTimer
@onready var time_label = $TimeLabel


var minutes
var points = 1
var points_to_be

func _ready():

	timer.one_shot = true
	timer.timeout.connect(_on_timer_finished)
func start_timer(minutes: int):
	timer.start(minutes * 60)
func _on_start_button_pressed():
	minutes = Global.task_length_value  
	
	if minutes <= 0:
		minutes = 1
	
	timer.start(minutes * 60)
pass 
func _process(delta):
	if not timer.is_stopped():
		var total_seconds = int(timer.time_left)
		var mins = total_seconds / 60
		var secs = total_seconds % 60
		time_label.text = "%02d:%02d" % [mins, secs]

func _on_timer_finished():
	time_label.text = "Done!"
	print("Points:", points)
