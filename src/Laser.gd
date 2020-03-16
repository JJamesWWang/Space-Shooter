extends RigidBody2D


const HitEffect: PackedScene = preload("res://src/HitEffect.tscn")

onready var laser_sound: AudioStreamPlayer = $LaserSound


func _ready():
	laser_sound.play()


func create_hit_effect() -> void:
	var root: Node = get_tree().current_scene
	var hit_effect: Node = HitEffect.instance()
	root.add_child(hit_effect)
	hit_effect.global_position = global_position
