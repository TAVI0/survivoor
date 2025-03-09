extends Node2D

const SPEED = 60

func _process(delta: float) -> void:
	var direction = (GLOBAL.player_position - position).normalized()
	position += direction * SPEED * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Shot"):
		area.queue_free()
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
