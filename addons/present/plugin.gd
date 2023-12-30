@tool
extends EditorPlugin

var nextslidebutton : Button
var player : Player
var display : Control
var feature_prof : String

func _enter_tree() -> void:
	feature_prof = EditorInterface.get_current_feature_profile()
	nextslidebutton = preload("res://addons/present/misc/next_slide_button.tscn").instantiate()
	nextslidebutton.icon = EditorInterface.get_editor_theme().get_icon("ArrowRight", "EditorIcons")
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, nextslidebutton)
	display = preload("res://addons/present/misc/display.tscn").instantiate()
	EditorInterface.get_editor_main_screen().add_child(display)
	_make_visible(false)
	player = Player.new()
	player.display = display
	print(player)
	player.load_slide()
	nextslidebutton.pressed.connect(player.next_slide)

func _exit_tree() -> void:
	EditorInterface.set_current_feature_profile(feature_prof)
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, nextslidebutton)
	if nextslidebutton:
		nextslidebutton.queue_free()
	if display:
		display.queue_free()

func _has_main_screen():
	return true

func _get_plugin_name() -> String:
	return "Slide"

func _get_plugin_icon() -> Texture2D:
	return EditorInterface.get_editor_theme().get_icon("PreviewEnvironment", "EditorIcons")

func _make_visible(visible: bool):
	#prints("currently held by", EditorInterface.get_)
	if display:
		display.visible = visible
