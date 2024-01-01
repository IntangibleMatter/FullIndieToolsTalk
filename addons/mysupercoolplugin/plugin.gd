@tool
extends EditorPlugin

const DOCK_SCENE = preload("res://addons/mysupercoolplugin/demo_dock_1/dock.tscn")
var dock : Control

func _enter_tree() -> void:
	dock = DOCK_SCENE.instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BR, dock)


func _exit_tree() -> void:
	remove_control_from_docks(dock)
	dock.free()
