extends Area2D

const Laser: PackedScene = preload("res://src/Laser.tscn")
const ExplosionEffect: PackedScene = preload("res://src/ExplosionEffect.tscn")

export var SPEED: int = 100

signal player_death


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


func _exit_tree() -> void:
	create_explosion()
	emit_signal("player_death")


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y += -SPEED * delta
	if Input.is_action_pressed("ui_down"):
		position.y += SPEED * delta
	if Input.is_action_just_pressed("ui_accept"):
		fire_laser()


func fire_laser() -> void:
	var laser = Laser.instance()
	var root = get_tree().current_scene
	root.add_child(laser)
	laser.global_position = global_position
	

func create_explosion():
	var explosion_effect = ExplosionEffect.instance()
	var root = get_tree().current_scene
	root.add_child(explosion_effect)
	explosion_effect.global_position = global_position
