extends HBoxContainer

@onready var name_input: LineEdit = $"Player_name/name_input"
@onready var class_dropdown: OptionButton =	$Class/class_dropdown
@onready var aspect_dropdown: OptionButton = $Aspect/aspect_dropdown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_populate_dropdown(class_dropdown, GameData.classes)
	_populate_dropdown(aspect_dropdown, GameData.aspects)


#populate dropdown for aspect and classes, can be used for other options later on
func _populate_dropdown(dropdown: OptionButton, items: Array) -> void:
	for item in items:
		dropdown.add_item(item.display_name)


#assign random names
func populate_placeholder(id: int):
	if name_input.text == "":
		name_input.text = GameData.placeholder_names[id]


#create the actual player
func create_player() -> Player:
	var p := Player.new()
	p.display_name = name_input.text.strip_edges()
	p.sburb_class = GameData.classes[class_dropdown.selected]
	p.aspect = GameData.aspects[aspect_dropdown.selected]
	return p


#checks for strays
func is_complete() -> bool:
	return name_input.text.strip_edges() != ""
