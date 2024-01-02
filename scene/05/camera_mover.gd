@tool
extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D

@export var cam_pos : Vector2:
	set(val):
		cam_pos = val
		queue_redraw()
@export var cam_scale : Vector2 = Vector2.ONE:
	set(val):
		cam_scale = val
		queue_redraw()
@export var shape : Shape2D:
	set(val):
		shape = val
		if Engine.is_editor_hint() and is_instance_valid(collision):
			collision.shape = shape

var trans_time := 0.3
var selected := false

func _ready() -> void:
	collision.shape = shape
	if Engine.is_editor_hint():
		EditorInterface.get_selection().selection_changed.connect(_check_selection)


func _check_selection() -> void:
	selected = self in EditorInterface.get_selection().get_selected_nodes()
	queue_redraw()


func _on_body_entered(_body: Node2D) -> void:
	var cam : Camera2D = get_viewport().get_camera_2d()
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_parallel(true)
	tween.tween_property(cam, "global_position", cam_pos, trans_time)
	tween.tween_property(cam, "zoom", cam_scale, trans_time)


func _draw() -> void:
	if not Engine.is_editor_hint():
		return
	var cam_base_size : Vector2 = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))
	var cam_draw_size : Vector2 = cam_base_size / cam_scale
	var cam_draw_pos : Vector2 = to_local(cam_pos) - (cam_draw_size/2)
	draw_rect(
		Rect2(cam_draw_pos, cam_draw_size),
		Color.DEEP_PINK if selected else Color.PINK,
		false,
		8.0 if selected else 4.0)
