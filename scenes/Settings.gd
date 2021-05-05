extends Control

func _ready():
	var _exit_pressed = $Back.connect("pressed", self, "_on_exit_pressed")

	
func _on_exit_pressed():
	var cs = "res://scenes/set-menu.tscn"
	get_tree().change_scene(cs)
