extends Area2D


const ExplosionEffect = preload("res://src/ExplosionEffect.tscn")

export var SPEED: int = 20
export var ARMOR: int = 3

signal exited_screen

func _ready() -> void:
	var root: Node = get_tree().current_scene
	connect("exited_screen", root, "_on_Enemy_exited_screen")


func _on_body_entered(body: Node) -> void:
	body.create_hit_effect()
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		create_explosion()
		add_to_score()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if ARMOR > 0:
		emit_signal("exited_screen")
	queue_free()


func _process(delta: float) -> void:
	position.x -= SPEED * delta


func create_explosion() -> void:
	var explosion_effect: Node = ExplosionEffect.instance()
	var root: Node = get_tree().current_scene
	root.add_child(explosion_effect)
	explosion_effect.global_position = global_position


func add_to_score() -> void:
	var root: Node = get_tree().current_scene
	if root.is_in_group("World"):
		root.score += 10
