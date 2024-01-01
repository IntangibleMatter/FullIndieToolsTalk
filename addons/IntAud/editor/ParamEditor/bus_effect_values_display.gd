@tool
extends VBoxContainer

var enable_options : Dictionary = {
		"name": "enabled",
		"class_name": &"",
		"type": 1,
		"hint": 1,
		"hint_string": "0,1",
		"usage": 6 
	}

var bus: int
var effect_index: int
 
@onready var effect_name = $EffectName
@onready var value_edit := preload("res://addons/IntAud/editor/ParamEditor/bus_effect_value_edit.tscn")

func _ready() -> void:
	var effect = AudioServer.get_bus_effect(bus, effect_index)
	effect_name.text = effect.get_class().replace("AudioEffect", "")
	
	var effect_settings := effect.get_property_list()
	
	var enable_edit := value_edit.instantiate()
	enable_edit.option = enable_options
	add_child(enable_edit)
	
	for effect_setting in effect_settings:
		if effect_setting["hint"] in [1,2] and effect_setting["usage"] == 6:
			var v := value_edit.instantiate()
			v.option = effect_setting
			add_child(v)
