@tool
class_name Player
extends EditorPlugin

var current_slide : SlideResource = preload("res://addons/present/slides/00.tres")

var display : Control



func open_tab(tab: String) -> void:
	EditorInterface.set_main_screen_editor(tab)


func _process(_delta: float) -> void:
	print("ASDIKJALS")


func next_slide() -> void:
	if not current_slide.next_slide:
		push_error("No next slide!!!")
		return
	
	current_slide = current_slide.next_slide
	load_slide()

func load_slide() -> void:
	match current_slide.slide_type:
		"scene":
			EditorInterface.open_scene_from_path(current_slide.file)
			
			var scntype := EditorInterface.get_edited_scene_root()
			print(scntype)
			if scntype is Node3D:
				open_tab("3D")
			else:
				open_tab("2D")
		"slide":
			print(current_slide.file)
			#for child in display.get_children():
				#child.queue_free()
			display.set_contents(load(current_slide.file).instantiate())
			open_tab("Slide")
