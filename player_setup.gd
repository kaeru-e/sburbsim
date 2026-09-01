extends Control


@onready var seed_input: LineEdit = $"Background/MarginContainer/Rows/Initialising/Game Session Seed/seed_input"
@onready var amount_input: OptionButton = $"Background/MarginContainer/Rows/Initialising/Player Amount/amount_dropdown"
@onready var player_row: VBoxContainer = $Background/MarginContainer/Rows/player_row
var players: Array[Player] = []
var player_amount_debug: int = 4
var player_select: PackedScene = preload("res://player_select.tscn")


func _ready() -> void:
	amount_input.add_item(str(player_amount_debug))
	_populate_players(player_amount_debug)

func _populate_players(amount: int):
	for i in range(amount):
		var row = player_select.instantiate()
		player_row.add_child(row)
		
