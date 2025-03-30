extends Node

var SAVE_FILE_NAME = "save"
var save_room
var save_player_position

var load_on = 0#임시코드

func _process(_delta) -> void:
	if Input.is_action_just_pressed("key_r"):
		load_game()

func save_game():
	## Save the game
	save_room = get_tree().current_scene.filename
	for player in get_tree().get_nodes_in_group("Player"):
		save_player_position = player.position
	var data = {}
	data["save_room"] = save_room
	data["save_player_position"] = save_player_position
	var f = File.new()
	f.open(SAVE_FILE_NAME, File.WRITE)
	f.store_var(data)
	f.close()

func load_game():
	## Load save data
	
	load_on = 1#임시코드
	
	var f = File.new()
	f.open(SAVE_FILE_NAME, File.READ)
	var data = f.get_var()
	save_room = data["save_room"]
	save_player_position = data["save_player_position"]
	f.close()
	get_tree().change_scene(save_room)
