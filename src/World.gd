extends Node

onready var score_label: Label = $ScoreLabel

var score: int = 0 setget set_score


func _on_Ship_player_death() -> void:
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://src/GameOverScreen.tscn")


func set_score(value: int) -> void:
	score = value
	update_score_label()


func update_score_label():
	score_label.text = "Score = " + str(score)	


func update_save_data():
	var save_data: = SaveAndLoad.load_data_from_file()
	if score > save_data.highscore:
		save_data.highscore = score
		SaveAndLoad.save_data_to_file(save_data)
