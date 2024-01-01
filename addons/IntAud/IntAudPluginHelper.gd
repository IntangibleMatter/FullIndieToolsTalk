@tool
class_name IntAudPluginHelper
extends Node

## Get the tree of params saved in IntAud.
func get_params_list() -> Dictionary:
	return {}

## get a value from the plugin_options.ini file. Returns null if value not found.
func get_option(opt: String) -> Variant:
	var cfg := ConfigFile.new()
	cfg.load("res://addons/IntAud/plugin_options.ini")
	return cfg.get_value("options", opt)
