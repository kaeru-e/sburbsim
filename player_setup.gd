extends Control

@onready var seed_input: LineEdit = $"Background/MarginContainer/Rows/Initialising/Game Session Seed/seed_input"
@onready var amount_input: OptionButton = $"Background/MarginContainer/Rows/Initialising/Player Amount/amount_dropdown"
@onready var class_dropdown: OptionButton =	$Background/MarginContainer/Rows/Player/Class/class_dropdown
@onready var aspect_dropdown: OptionButton = $Background/MarginContainer/Rows/Player/Aspect/aspect_dropdown

var players: Array[Player] = []

func _ready() -> void:
	print(GameData.classes)
	print(GameData.aspects)
