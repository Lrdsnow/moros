extends Control

var following = false
var dragging_start_position = Vector2()

func _ready():
	if OS.get_name() == "Linux":
		$usr/ver.add_item("Latest (v1 Beta 3)", -1)
	if OS.get_name() == "OSX":
		$usr/ver.add_item("None", -1)
		$usr/err/err.text = "OSX Not Supported!"
		$usr/err.window_title = "ERROR!"
		$usr/err.popup_centered()
	if OS.get_name() == "Windows":
		$usr/ver.add_item("Latest (v1 Beta 3)", -1)
		$usr/ver.add_item("Latest G3 (v1 Beta 2)", 0)
		$usr/ver.add_item("v1 Beta 2", 1)

func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)


func _on_CloseButton_pressed():
	get_tree().quit()


func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)


func _on_play_pressed():
	if OS.get_name() == "Windows":
		if $usr/ver.selected == -1:
			var game = OS.get_executable_path().get_base_dir()
			game = game + "/game/win64/LG2/moros.exe"
# warning-ignore:return_value_discarded
			OS.execute(game, [], true)
		if $usr/ver.selected == 0:
			var game = OS.get_executable_path().get_base_dir()
			game = game + "/game/win64/LG3/moros.exe"
# warning-ignore:return_value_discarded
			OS.execute(game, [], true)
		if $usr/ver.selected == 1:
			var game = OS.get_executable_path().get_base_dir()
			game = game + "/game/win64/v1b2/moros.exe"
# warning-ignore:return_value_discarded
			OS.execute(game, [], true)
	if OS.get_name() == "Linux":
		if $usr/ver.selected == -1:
			var game = OS.get_executable_path().get_base_dir()
			game = game + "/game/lin32/LG2/moros.x86"
			OS.execute("sudo", ["chmod", "a+x", game], true)
			OS.execute(game, [], true)
	if OS.get_name() == "OSX":
		$usr/err/err.text = "OSX Not Supported!"
		$usr/err.window_title = "ERROR!"
		$usr/err.popup_centered()


func _on_opt_pressed():
	$usr.hide()
	$img.hide()
	$opt.show()


func _on_moros_pressed():
	$usr.show()
	$img.show()
	$opt.hide()
