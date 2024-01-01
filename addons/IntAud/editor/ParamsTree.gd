@tool
extends VBoxContainer

@onready var params_tree = $ParamsTree
@onready var delete_confirmation_dialog = $EventButtons/Delete/DeleteConfirmationDialog


func _ready() -> void:
	pass # Replace with function body.


func _on_new_folder_pressed() -> void:
	pass # Replace with function body.


func _on_new_param_pressed() -> void:
	pass # Replace with function body.


func _on_delete_pressed() -> void:
	var item : TreeItem = params_tree.get_selected()
	
	if not item:
		return
	
	delete_confirmation_dialog.title = "Delete %s?"%item.get_text(0)
	delete_confirmation_dialog.popup()

func _on_delete_confirmation_dialog_confirmed() -> void:
	var item : TreeItem = params_tree.get_selected()
	
	delete_item(item)

func delete_item(item: TreeItem) -> void:
	if item.get_child_count() > 0:
		for child in item.get_children():
			delete_item(child)
	
	item.free()
