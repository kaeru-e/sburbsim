extends HBoxContainer

@onready var class_dropdown: OptionButton =	$Aspect/aspect_dropdown
@onready var aspect_dropdown: OptionButton = $Class/class_dropdown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_populate_dropdown(class_dropdown, GameData.classes)
	_populate_dropdown(aspect_dropdown, GameData.aspects)

func _populate_dropdown(dropdown: OptionButton, items: Array) -> void:
	for item in items:
		dropdown.add_item(item.display_name)
