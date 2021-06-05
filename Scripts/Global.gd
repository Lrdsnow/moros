extends Node

var sound_controller = null

func play_sound(sound):
	if sound_controller != null:
		if sound_controller.has_node(sound):
			sound_controller.get_node(sound).play()
