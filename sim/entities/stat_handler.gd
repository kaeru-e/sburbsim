class_name StatHandler

var statlist := {}

func _init() -> void:
	print("StatHandler running")
	for stat in GameData.stat_types:
		statlist[stat.display_name] = stat.duplicate(true)
		print("Initialise Stat: " + stat.display_name)
	print(statlist)


func get_stat(stat_name: String) -> Resource:
	return statlist.get(stat_name)

func add_modifier(stat_name: String, modifier: int):
	var res = statlist.get(stat_name)
	res.default += modifier
	print("Added ",modifier," to ",stat_name,". New value is ",res.default)

func subtract_modifier(stat_name: String, modifier: int):
	var res = statlist.get(stat_name)
	res.default -= modifier
	print("Subtracted ",modifier," to ",stat_name,". New value is ",res.default)
