extends Node

func _ready():
	Global.sound_controller = self
	
func _exit_tree():
	Global.sound_controller = null
