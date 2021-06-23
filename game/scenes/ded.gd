extends Control

func _ready():
		var _play_pressed = $play.connect("pressed", self, "_on_play_pressed")
		var _Exit_pressed = $Exit.connect("pressed", self, "_on_Exit_pressed")
# When a Host button is pressed
func _on_play_pressed():
# warning-ignore:return_value_discarded
	var cs = "res://scenes/new-lev1.tscn"
	get_tree().change_scene(cs)

func _on_Exit_pressed():
	if OS.has_feature('JavaScript'):
		get_tree().change_scene("res://scenes/blank.tscn")
	else:
		get_tree().quit()
