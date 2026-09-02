extends Control


@onready var seed_input: LineEdit = $"Background/MarginContainer/Rows/Initialising/Game Session Seed/seed_input"
@onready var amount_input: OptionButton = $"Background/MarginContainer/Rows/Initialising/Player Amount/amount_dropdown"
@onready var player_row: VBoxContainer = $Background/MarginContainer/Rows/ScrollContainer/player_row
@onready var start_button: Button = $Background/MarginContainer/Rows/HBoxContainer/start_game


var player_select: PackedScene = preload("player_select.tscn")


func _ready() -> void:
	_populate_amount()
	_place_holder()
	start_button.pressed.connect(_initialise_players)
	amount_input.item_selected.connect(_on_amount_selected)


#sets a random amount of players at startup
func _place_holder():
	var number = randi_range(GameData.min_player_amount, GameData.max_player_amount)
	amount_input.select(number-2)
	_populate_players(number)


#clears the rows
func _clear_player_rows() -> void:
	for child in player_row.get_children():
		child.queue_free()


#function to change the amount of players when updated
func _on_amount_selected(index: int) -> void:
	_clear_player_rows()
	_populate_players(int(amount_input.get_item_text(index)))


#populates the optionbox for player amount
func _populate_amount():
	for item in range(GameData.min_player_amount, GameData.max_player_amount + 1):
		amount_input.add_item(str(item))


#adds a scene for every player
func _populate_players(amount: int):
	var placeholder_id: int = 0
	for i in range(amount):
		var row = player_select.instantiate()
		player_row.add_child(row)
		row.populate_placeholder(placeholder_id)
		placeholder_id+=1


#checks if all the players are c
func _initialise_players():
	GameData.player_data.clear()
	for row in player_row.get_children():
		if not row.is_complete():
			print("Not all players are complete!")
			return
		var new_player = row.create_player()
		print(new_player.sburb_class.display_name," of ",new_player.aspect.display_name, " is initialised")
		GameData.player_data.append(new_player)
	print("Created a session with ", GameData.player_data.size() ," Players")
