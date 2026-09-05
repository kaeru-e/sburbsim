class_name	Land

var display_name: String = ""
var level: String = ""


func _init(): 
	display_name = random_name()


func random_name() -> String:
	var list = GameData.default_land_names
	var random = randi_range(0,list.size()-1)
	var random2 = randi_range(0,list.size()-1)
	var name = "Land of " + list[random] + " and " + list[random2]
	return name
