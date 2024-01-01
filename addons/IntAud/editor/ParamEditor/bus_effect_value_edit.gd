@tool
extends Panel

@onready var option_name = $HBoxContainer/OptionName
@onready var connect_button = $HBoxContainer/ButtonsContainer/ConnectButton
@onready var edit_param = $HBoxContainer/ButtonsContainer/EditParam
@onready var disconnect_button = $HBoxContainer/ButtonsContainer/DisconnectButton

var option : Dictionary

func _ready() -> void:
	edit_param.hide()
	disconnect_button.hide()
	connect_button.show()
#	print(option)
	option_name.text = option.name.replace("_", " ")
	connect_button.get_popup().id_pressed.connect(_param_selected.bind())
	

#func init(effect_option: Dictionary) -> void:
#	option = effect_option


func _param_selected(_id):
	connect_button.hide()
	edit_param.show()
	disconnect_button.show()


func _on_disconnect_button_pressed():
	connect_button.show()
	edit_param.hide()
	disconnect_button.hide()
