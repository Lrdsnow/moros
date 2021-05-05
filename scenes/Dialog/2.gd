extends Control

func _ready():
	$Timer.set_wait_time(0.5)
	$Timer.start()
	yield($Timer, "timeout")
	var debug = "res://scenes/Room_01.tscn"
	get_tree().change_scene(debug)







