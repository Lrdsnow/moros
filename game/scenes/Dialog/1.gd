extends Control

func _ready():
	$Timer.set_wait_time(0.5)
	$Timer.start()
	yield($Timer, "timeout")
	var debug = "res://scenes/Dialog/2.tscn"
	get_tree().change_scene(debug)
