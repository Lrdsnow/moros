extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$window/text.text = "Detecting OS"
	var os = OS.get_name()
	if os == "Android" or os == "iOS":
		$window/text.text = "Mobile Not Supported"
		if os == "Android":
			print("android Found")
			$window/os.text = "Android"
		else:
			if os == "iOS":
				print("ios Found")
			$window/os.text = "IOS"
	else:
		if os == "Windows":
			$window/text.text = "Thank You For Using Moros Launcher!"
			print("Windows Found")
			$window/os.text = "Windows"
			get_tree().change_scene("res://main.tscn")
		else:
			if os == "Linux" or os == "OSX":
				$window/text.text = "Thank You For Playing Moros!"
				print("Unix Found")
				$window/os.text = "Unix (Mac or Linux)"
				get_tree().change_scene("res://main.tscn")
			else:
				if os == "HTML5":
					$window/text.text = "OS Undetected Or Using HTML5"
					print("OS Undetected Or Using HTML5")
					$window/os.text = "Unkown OS Running HTML5"
					get_tree().change_scene("res://main.tscn")
				else:
					$window/text.text = "OS Undetected Or Using HTML5"
					print("OS Undetected Or Using HTML5")
					$window/os.text = "Unkown (Not HTML5)"
					get_tree().change_scene("res://main.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
