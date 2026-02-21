extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("background_2", Callable(self, "change_to_background_2"))
	Global.connect("background_3", Callable(self, "change_to_background_3"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_to_background_2():
	$Background.texture = load("res://Images/Background_house.png")

func change_to_background_3():
	$Background.texture = load("res://Images/Background_house&Cows.png")
