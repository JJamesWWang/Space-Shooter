extends Node


onready var highscore_label: Label = $HighscoreLabel


func _ready() -> void:
	set_highscore_label()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://src/StartMenu.tscn")


func set_highscore_label():
	var save_data: = SaveAndLoad.load_data_from_file()
	highscore_label.text = "Highscore: " + str(save_data.highscore)
