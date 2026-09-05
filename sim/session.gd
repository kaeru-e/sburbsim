class_name Session
extends RefCounted

var players_in_session: Array[Player]
var lands: Array[Land]

func _init() -> void:
	print("Session running")
