extends HBoxContainer

#References to nodes
@onready var xp_bar = $XPBar
@onready var level_label = $LevelLabel

#Level and XP data
var level: int = 1
var current_xp: int = 0
var xp_to_next_level: int = 100 #Initial XP needed

#Compounding XP parameters
var base_xp: int = 100         # XP needed for level 1 → 2
var growth_factor: float = 1.2 # 20% more XP required per level

# Save file path
const SAVE_PATH = "user://level_save.save"

#Call when the node enters the scene tree
func _ready():
	load_progress()
	update_ui()

# Add XP and handle level-ups
func add_xp(amount: int):
	current_xp += amount
	while current_xp >= xp_to_next_level:
		current_xp -= xp_to_next_level
		level += 1
		xp_to_next_level = calculate_xp_for_next_level(level)
		_on_level_up(level)
	update_ui()
	save_progress()

#Calculate compound XP needed for next level
func calculate_xp_for_next_level(lvl: int) -> int:
	return int(base_xp * pow(growth_factor, lvl - 1))

#Updates UI XP bar and level label
func update_ui():
	xp_bar.max_value = xp_to_next_level
	xp_bar.value = current_xp
	level_label.text = "Level %d" % level
	# Optional: tooltip shows XP numbers
	xp_bar.hint_tooltip = "%d/%d XP" % [current_xp, xp_to_next_level]

#Called when player levels up
func _on_level_up(new_level: int):
	print("Leveled up to %d!" % new_level)
	# Optional: trigger animation or sound here

#Save player progress
func save_progress():
	var file = FileAccess.open(SAVE_PATH, FileAccess.ModeFlags.WRITE)
	if file:
		file.store_var({
			"level": level,
			"current_xp": current_xp
		})
		file.close()

#Load player progress
func load_progress():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.ModeFlags.READ)
		if file != null:
			var data = file.get_var()
			level = data.get("level", 1)
			current_xp = data.get("current_xp", 0)
			xp_to_next_level = calculate_xp_for_next_level(level)
			file.close()
