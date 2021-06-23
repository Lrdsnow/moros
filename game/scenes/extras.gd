extends Node

func _ready():
		var _play_pressed = $early.connect("pressed", self, "_on_play_pressed")
# When a Host button is pressed
func _on_play_pressed():
# warning-ignore:return_value_discarded
	var cs = "res://scenes/early.tscn"
	get_tree().change_scene(cs)

func _on_exit_pressed():
	var cs = "res://scenes/menu.tscn"
	get_tree().change_scene(cs)
