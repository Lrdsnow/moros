extends Control

var following = false
var dragging_start_position = Vector2()
onready var download_file = ""

func _ready():
	checkupdate()
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
	

func download(url : String, target : String):
	$web.download_file = target # where to save the downloaded file
	$web.request(url) # start the download

func checkupdate():
	var dir = Directory.new()
	dir.open(OS.get_executable_path().get_base_dir())
	dir.make_dir("temp")
	var downdir = OS.get_executable_path().get_base_dir() + "/temp"
	var downfile = downdir + "/version.txt"
	download("https://raw.githubusercontent.com/Lrdsnow/moros/main/version.txt", downfile)
	var f = File.new()
	f.open(downfile, File.READ)
	var lv = f.get_line()
	var nf = File.new()
	var cvf = OS.get_executable_path().get_base_dir() + "v.txt"
	nf.open(cvf, File.READ)
	var cv = nf.get_line()
	if lv == cv:
		pass
	else:
		$usr/u.window_title = "Update Needed!"
		$usr/u/u.text = "Update Needed!"
		$usr/u.popup_centered()
	dir.remove(downdir)


func _on_update_pressed():
	print("Updating...")
	var dir = Directory.new()
	dir.open(OS.get_executable_path().get_base_dir())
	dir.make_dir("temp")
	var downdir = OS.get_executable_path().get_base_dir() + "/temp"
	var downfile = downdir + "/update.zip"
	download("https://w3g3a5v6.ssl.hwcdn.net/upload2/game/977500/4054974?GoogleAccessId=uploader@moonscript2.iam.gserviceaccount.com&Expires=1624420495&Signature=pSLhQnI2ZjiVMyXy4QP6AxcefT1Nr%2B1oy5hYxMin0rEQ0XLJkQ1h3iFCR7J%2F%2BWbxx%2BUWtCaxQVCDHNl6mdFt7G3p%2F6vgbzl2rZV%2BZj02oz2HFkhun56eh74BtLb7P%2FC6f695KGx3RFEyARMPmv3tDww%2Bu37TkzGYwZU0KUTpBT1O8rY5rymUAsHEdTbm0COv6wKHF%2BC3SKZ8s05EcvKHe13v7pI3A45WI9JGHC79yHxx8amWfvZ7XiqMqpuEcXmv1eEW4%2BIzKg4eiJRPgCnqYCd7fqQz06X%2Fn629TXjsNOTGR1%2Fyrd0sp0vIbmBjyCY0DQFM62tkILlkDLfSo15aJA==&hwexp=1624420755&hwsig=667c7c3d2db970b6fbb55e4293ea65e5", downfile)
	OS.execute("tar", ["-xf", downfile], false)
