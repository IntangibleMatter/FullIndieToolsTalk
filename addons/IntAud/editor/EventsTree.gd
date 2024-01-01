@tool
extends Tree

@onready var iah := IntAudPluginHelper.new()

var banks_path : String

enum INTAUD_TYPES {FOLDER, BANK, EVENT}

func _ready() -> void:
	banks_path = iah.get_option("data_storage_location")
	get_events_tree()


func get_events_tree() -> void:
	clear()
	create_item()
	hide_root = true
	get_banks_and_folders(banks_path)


func get_banks_and_folders(path: String) -> void:
	get_folders(path)
	get_banks(path)


func get_folders(path: String) -> void:
	var folders : PackedStringArray = DirAccess.get_directories_at(path)
	for folder in folders:
		add_folder(folder, get_tree_item_at_path(path).create_child())
		get_banks_and_folders("{0}/{1}".format([path, folder]))

func get_banks(path: String) -> void:
	var files_in_folder := DirAccess.get_files_at(path)
	for file in files_in_folder:
		print(file)
		if file.split(".")[-1] == "tres":
			var f : Resource = load("{0}/{1}".format([path, file]))
			print(f is IntAudBank)
			if f is IntAudBank:
				var bank_item : TreeItem = get_tree_item_at_path(path).create_child()
				add_bank(f, file.replace(".tres", ""), bank_item)


func add_folder(name: String, tree_item: TreeItem) -> void:
	tree_item.set_text(0, name)
	tree_item.set_icon(0, load("res://addons/IntAud/icons/folder.svg"))
	tree_item.set_metadata(0, {"type": INTAUD_TYPES.FOLDER, "filename": name})


func add_bank(bank: IntAudBank, name: String, tree_item: TreeItem) -> void:
	tree_item.set_text(0, name)
	tree_item.set_icon(0, load("res://addons/IntAud/icons/bank.svg"))
	tree_item.set_metadata(0, {"type": INTAUD_TYPES.BANK, "filename": name})
	for event in bank.events:
		add_event(event, tree_item)


func add_event(event: String, tree_item: TreeItem) -> void:
	var event_item : TreeItem = tree_item.create_child()
	event_item.set_text(0, event)
	event_item.set_icon(0, load("res://addons/IntAud/icons/event.svg"))
	event_item.set_metadata(0, {"type": INTAUD_TYPES.EVENT, "filename": name})


func get_tree_item_at_path(path: String) -> TreeItem:
	var items : PackedStringArray = path.split("/")
	var curr_tree_item : TreeItem = get_root()
	
	for item in items:
		if item == "":
			continue
		for child in curr_tree_item.get_children():
			if child.get_text(0) == item:
				curr_tree_item = child
				break
	return curr_tree_item

