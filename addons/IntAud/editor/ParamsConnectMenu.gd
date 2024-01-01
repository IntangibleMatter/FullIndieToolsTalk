@tool
extends ScrollContainer

var bus_display_scene := preload("res://addons/IntAud/editor/ParamEditor/bus_display.tscn")

@onready var busses_display_container = $HBoxContainer

func _ready() -> void:
	create_busses()


func reload() -> void:
	for c in busses_display_container.get_children():
		c.queue_free()
		
	create_busses()

func create_busses() -> void:
	prints("busses:", AudioServer.bus_count)
	for i in range(AudioServer.bus_count):
		var bds := bus_display_scene.instantiate()
		bds.bus = i
		busses_display_container.add_child(bds)
