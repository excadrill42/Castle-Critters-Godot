extends Node

@onready var tasks_completed = 2
@onready var task_length_input = 0
@onready var tasks_total = 10
@onready var level = 0
@onready var username = 0
var task_name = ""

signal background_2()
signal background_3()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func level_1():
	emit_signal("background_2")
	
func level_2():
	emit_signal("background_3")
