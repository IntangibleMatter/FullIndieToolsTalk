@tool
extends Control

@onready var effects_list := $VBoxContainer/EffectsListScrollContainer/EffectsList
@onready var values_display := preload("res://addons/IntAud/editor/ParamEditor/bus_effect_values_display.tscn")
@onready var bus_name = $VBoxContainer/BusName

@onready var value_edit := preload("res://addons/IntAud/editor/ParamEditor/bus_effect_value_edit.tscn")

var bus_options: Array[Dictionary] = [
	{
		"name": "volume",
		"class_name": &"",
		"type": 3,
		"hint": 1,
		"hint_string": "-80,6,suffix:dB",
		"usage": 6 
	},
	{
		"name": "muted",
		"class_name": &"",
		"type": 1,
		"hint": 1,
		"hint_string": "0,1",
		"usage": 6 
	}
]

var bus: int

func _ready() -> void:
	clear_effects_list()
	bus_name.text = AudioServer.get_bus_name(bus)
	add_bus_options_to_effects()
	for i in range(AudioServer.get_bus_effect_count(bus)):
		create_effect(i)

func clear_effects_list() -> void:
	for child in effects_list.get_children():
		child.queue_free()


func add_bus_options_to_effects() -> void:
	for option in bus_options:
		var v := value_edit.instantiate()
		v.option = option
		effects_list.add_child(v)

func create_effect(effect_index: int) -> void:
	var e := values_display.instantiate()
	e.bus = bus
	e.effect_index = effect_index
#	e.init(bus, effect_index)
	effects_list.add_child(e)
