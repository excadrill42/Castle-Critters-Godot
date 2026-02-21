extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal xp_changed(current_xp, xp_needed)
signal level_changed(level)

var base_xp_needed = 10.0
var xp_growth_rate = 1.2

var current_level = 0
var current_xp = 0.0
var xp_needed = base_xp_needed

func add_xp(amount):
	current_xp += amount

	# Level-up loop
	while current_xp >= xp_needed:
		current_xp -= xp_needed
		current_level += 1
		xp_needed *= xp_growth_rate

		emit_signal("level_changed", current_level)

	emit_signal("xp_changed", current_xp, xp_needed)
