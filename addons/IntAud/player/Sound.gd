extends Node

@onready var param_handler = $ParamHandler

var events : Dictionary

func set_param(param: StringName, value: float) -> void:
	param_handler.set_param(param, value)


func set_event_param(event: StringName, param: StringName, value: float) -> void:
	pass


func verify_event_exists(event: StringName) -> bool:
	return events.has(event) and events[event].is_valid_instance()
