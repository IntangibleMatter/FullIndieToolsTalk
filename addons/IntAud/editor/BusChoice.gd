@tool
extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	update_busses()
	AudioServer.bus_layout_changed.connect(update_busses)


func update_busses() -> void:
	clear()
	for i in range(AudioServer.bus_count):
		add_item(AudioServer.get_bus_name(i), i)
