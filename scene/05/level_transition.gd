@tool
extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D


@export var shape : Shape2D:
	set(val):
		shape = val
		if Engine.is_editor_hint() and is_instance_valid(collision):
			collision.shape = shape

@export_file("*.tscn") var transition_to : String


func _ready() -> void:
	collision.shape = shape


func _on_body_entered(_body: Node2D) -> void:
	if transition_to:
		get_tree().change_scene_to_file(transition_to)
