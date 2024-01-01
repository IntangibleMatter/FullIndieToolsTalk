@tool
extends VBoxContainer

@onready var new_folder := $EventButtons/NewFolder
@onready var new_bank: Button = $EventButtons/NewBank
@onready var new_event := $EventButtons/NewEvent
@onready var events_tree := $EventsTree
@onready var delete_confirmation_dialog := $EventButtons/Delete/DeleteConfirmationDialog


@onready var folder_icon := preload("res://addons/IntAud/icons/folder.svg")
@onready var event_icon := preload("res://addons/IntAud/icons/event.svg")

func _ready() -> void:
	pass
#	events_tree.hide_root = true


func _on_new_folder_pressed() -> void:
	var f = events_tree.create_item()
	f.set_text(0, str(randi()))
	f.set_icon(0, folder_icon)


func _on_new_event_pressed():
	pass # Replace with function body.


func _on_delete_pressed() -> void:
	var item : TreeItem = events_tree.get_selected()
	
	if not item:
		return
	
	delete_confirmation_dialog.title = "Delete %s?"%item.get_text(0)
	delete_confirmation_dialog.popup()


func _on_delete_confirmation_dialog_confirmed() -> void:
	var item : TreeItem = events_tree.get_selected()
	
	delete_item(item)

func delete_item(item: TreeItem) -> void:
	if item.get_child_count() > 0:
		for child in item.get_children():
			delete_item(child)
	
	item.free()


func _on_events_tree_item_selected() -> void:
	match events_tree.get_selected().get_metadata(0)["type"]:
		0: # folder
			new_folder.disabled = false
			new_bank.disabled = false
			new_event.disabled = true
		1: # bank
			new_folder.disabled = true
			new_bank.disabled = true
			new_event.disabled = false
		2: # event
			new_folder.disabled = true
			new_bank.disabled = true
			new_event.disabled = true
