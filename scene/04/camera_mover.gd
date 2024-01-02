extends Area2D

@export var cam_pos : Vector2
@export var cam_scale : Vector2 = Vector2.ONE

var trans_time := 0.3

func _on_body_entered(body: Node2D) -> void:
	var cam : Camera2D = get_viewport().get_camera_2d()
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel(true)
	tween.tween_property(cam, "global_position", cam_pos, trans_time)
	tween.tween_property(cam, "zoom", cam_scale, trans_time)

