extends Node

#stuff we dont forget between sims
var aspects: Array[Aspect] = []
var classes: Array[SBURBClass] = []
var placeholder_names: Array[String] = []

#temp storage between sims so we can do multiple seeds for a group of players
var player_data: Array[Player] = []

# main game constraints
var min_player_amount: int = 2
var max_player_amount: int = 12


func _ready() -> void:
	_load_into(aspects, "res://data/aspect/")
	_load_into(classes, "res://data/class/")
	_grab_placeholder_names("res://data/names.txt", placeholder_names)


func _load_into(target: Array, path: String) -> void:
	var list: Array = ResourceLoader.list_directory(path)
	if list.is_empty():
		push_warning("No files found in %s" % path)
	for file_name in list:
		if file_name.ends_with(".tres"):
			var res: Resource = load(path + file_name)
			target.append(res)


func _grab_placeholder_names(filepath: String, list: Array[String]):
	var file := FileAccess.open(filepath, FileAccess.READ)
	while file.get_position() < file.get_length():
		list.append(file.get_line())
