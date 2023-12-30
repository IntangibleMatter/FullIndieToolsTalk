@tool
extends Control


func set_contents(contents: CanvasItem) -> void:
	if get_child_count() > 0:
		for child in get_children():
			child.queue_free()
	
	add_child(contents)


func focus_self() -> void:
	EditorInterface.set_main_screen_editor("Slide")
