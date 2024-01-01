@tool
extends VBoxContainer

@onready var twerk: Control = $Twerk
@onready var button: Button = $Button


func _on_button_pressed() -> void:
	if twerk.playing:
		twerk.stop()
	else:
		twerk.play()
