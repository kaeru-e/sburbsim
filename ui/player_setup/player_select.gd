extends HBoxContainer

@onready var name_input: LineEdit = $player_info/selectable/player_name/name_input
@onready var class_dropdown: OptionButton =	$player_info/selectable/class/class_dropdown
@onready var aspect_dropdown: OptionButton = $player_info/selectable/aspect/aspect_dropdown

@onready var aspect_image: Sprite2D = $profile/aspect_image

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_populate_dropdown(class_dropdown, GameData.classes)
	_populate_dropdown(aspect_dropdown, GameData.aspects)
	set_player_icon(GameData.aspects[aspect_dropdown.selected])
	aspect_dropdown.item_selected.connect(_change_icon)
	


#populate dropdown for aspect and classes, can be used for other options later on
func _populate_dropdown(dropdown: OptionButton, items: Array) -> void:
	for item in items:
		dropdown.add_item(item.display_name)

func _change_icon(index: int):
	set_player_icon(GameData.aspects[index])


#assign random names
func populate_placeholder(id: int):
	if name_input.text == "":
		name_input.text = GameData.placeholder_names[id]

func set_player_icon(aspect: Aspect):
	var new_texture = load("res://sprites/aspects/"+aspect.display_name.to_lower()+".png")
	aspect_image.texture = new_texture


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
