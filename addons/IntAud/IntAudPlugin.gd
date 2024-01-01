@tool
extends EditorPlugin

const AudioEditor = preload("res://addons/IntAud/editor/IntAudEditor.tscn")

var audio_editor_instance

func _enter_tree():
	add_autoload_singleton("Music", "res://addons/IntAud/player/Music.tscn")
	add_autoload_singleton("Sound", "res://addons/IntAud/player/Sound.tscn")
	
	audio_editor_instance = AudioEditor.instantiate()
	# Add the main panel to the editor's main viewport.
	get_editor_interface().get_editor_main_screen().add_child(audio_editor_instance)
	# Hide the main panel. Very much required.
	_make_visible(false)
	
	var iah : Node = IntAudPluginHelper.new()
	
	print(iah.get_option("data_storage_location"))
	
	DirAccess.make_dir_recursive_absolute(iah.get_option("data_storage_location"))


func _exit_tree():
	remove_autoload_singleton("Music")
	remove_autoload_singleton("Sound")
	
	if audio_editor_instance:
		audio_editor_instance.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if audio_editor_instance:
		audio_editor_instance.visible = visible


## If your plugin doesn't handle any node types, you can remove this method.
#func _handles(object):
#	return object is preload("res://addons/main_screen/handled_by_main_screen.gd")


func _get_plugin_name():
	return "Audio"


func _get_plugin_icon():
	# Must return some kind of Texture2D for the icon.
	return preload("res://addons/IntAud/icons/IntAud.svg")
