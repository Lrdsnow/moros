extends Node

func _ready():
		var _new_pressed = $display/menu/new.connect("pressed", self, "_on_new_pressed")
# When a Host button is pressed
func _on_new_pressed():
# warning-ignore:return_value_discarded
	var main = "res://scenes/lev1.tscn"
	get_tree().change_scene(main)
