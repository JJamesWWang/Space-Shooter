extends Node2D


const Enemy: PackedScene = preload("res://src/Enemy.tscn")

onready var spawn_points: Node2D = $SpawnPoints



func _on_Timer_timeout() -> void:
	spawn_enemy()


func get_spawn_point() -> Position2D:
	var points: Array = spawn_points.get_children()
	points.shuffle()
	return points[0].global_position


func spawn_enemy():
	var spawn_point: = get_spawn_point()
	var enemy: Node = Enemy.instance()
	var root: Node = get_tree().current_scene
	root.add_child(enemy)
	enemy.global_position = spawn_point
