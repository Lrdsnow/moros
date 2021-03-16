extends Node

func _ready():
		var _play_pressed = $display/menu/play.connect("pressed", self, "_on_play_pressed")
		OS.set_window_fullscreen(!OS.window_fullscreen)
# When a Host button is pressed
func _on_play_pressed():
# warning-ignore:return_value_discarded
	var cs = "res://scenes/CS.tscn"
	get_tree().change_scene(cs)
