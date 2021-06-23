extends Node2D


func _ready():
		var _play_pressed = $temp.connect("pressed", self, "_on_play_pressed")
# When a Host button is pressed
func _on_play_pressed():
# warning-ignore:return_value_discarded
	var cs = "res://scenes/16.tscn"
	get_tree().change_scene(cs)
