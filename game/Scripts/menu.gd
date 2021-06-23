extends Node

onready var splash = GameData.Fullscreen
var episode = GameData.episode
var ep1path = GameData.ep1path

signal splash

func _ready():
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if splash == 0:
			var mobile = JavaScript.eval("if( /Android|webOS|iPhone|iPad|iPod|Opera Mini/i.test(navigator.userAgent) ) {var mobile = true}", true)
			if mobile == true:
				get_tree().change_scene("res://scenes/mobile.tscn")
			emit_signal("splash")
			GameData.Fullscreen = 1
		var save_game = File.new()
		if save_game.file_exists("user://other.save"):
			$settings/delsave.disabled = false
			load_level()
			episode = GameData.episode
		if not save_game.file_exists("user://savegame.save"):
			$settings/delsave.disabled = true
			$load.set_disabled(1)
		var _play_pressed = $play.connect("pressed", self, "_on_play_pressed")
		var _load_pressed = $load.connect("pressed", self, "_on_load_pressed")
		var _set_pressed = $Settings.connect("pressed", self, "_on_set_pressed")
		var _extras_pressed = $extras.connect("pressed", self, "_on_extras_pressed")
		var _exit_pressed = $Exit.connect("pressed", self, "_on_exit_pressed")
# When a Host button is pressed
func _on_play_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("to-ep")

	
func _on_load_pressed():
	Global.play_sound("MenuClicked")
# warning-ignore:return_value_discarded
	load_game()

func _on_set_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("to-set")
	
func _on_extras_pressed():
	Global.play_sound("MenuClicked")
# warning-ignore:return_value_discarded
	$AnimationPlayer.play("to-extras")
	
func _on_exit_pressed():
	Global.play_sound("MenuClicked")
	if OS.has_feature('JavaScript'):
		get_tree().change_scene("res://scenes/blank.tscn")
	else:
		get_tree().quit()
		
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "episode" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

	save_game.close()
	
func load_file(file):

	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		print(line + str(index))

		index += 1
	f.close()
	return

func load_game_saves():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "episode" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])

	save_game.close()


func _on_back_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("to-menu")


func load_level():
	var save_file = File.new()
	if not save_file.file_exists("user://other.save"):
		return
	save_file.open("user://other.save", File.READ)
	GameData.episode = int(save_file.get_line())
	GameData.ep1path = int(save_file.get_line())
	save_file.close()

func save_level():
	var save_file = File.new()
	save_file.open("user://other.save", File.WRITE)
	save_file.store_line(str(GameData.episode))
	save_file.store_line(str(GameData.ep1path))
	save_file.close()


func _on_Back_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("back-set")


func _on_delsave_pressed():
	Global.play_sound("MenuClicked")
	var dir = Directory.new()
	dir.remove("user://savegame.save")
	dir.remove("user://other.save")
	$settings/delsave.disabled = true


func _on_back2_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("back-extras")


func _on_GBack_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("back-graphics")


func _on_Graphics_pressed():
	Global.play_sound("MenuClicked")
	$AnimationPlayer.play("to-graphics")
	
func main(setting):
	pass
