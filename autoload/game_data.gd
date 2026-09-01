extends Node


var aspects: Array[Aspect] = []
var classes: Array[SBURBClass] = []


func _ready() -> void:
	_load_into(aspects, "res://data/aspect/")
	_load_into(classes, "res://data/class/")

func _load_into(target: Array, path: String) -> void:
	var list: Array = ResourceLoader.list_directory(path)
	if list.is_empty():
		push_warning("No files found in %s" % path)
	for file_name in list:
		if file_name.ends_with(".tres"):
			var res: Resource = load(path + file_name)
			target.append(res)
