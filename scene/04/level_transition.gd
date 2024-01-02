extends Area2D


@export_file("*.tscn") var transition_to : String


func _on_body_entered(body: Node2D) -> void:
	if transition_to:
		get_tree().change_scene_to_file(transition_to)
