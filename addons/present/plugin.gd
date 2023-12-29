@tool
extends EditorPlugin

var nextslidebutton : Button

func _enter_tree() -> void:
	nextslidebutton = preload("res://addons/present/obj/next_slide_button.tscn").instantiate()
	nextslidebutton.icon = EditorInterface.get_editor_theme().get_icon("ArrowRight", "EditorIcons")
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, nextslidebutton)

func _exit_tree() -> void:
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, nextslidebutton)
	if nextslidebutton:
		nextslidebutton.queue_free()
