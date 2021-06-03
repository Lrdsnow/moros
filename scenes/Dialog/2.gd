extends Control

func _ready():
	$Timer.set_wait_time(0.5)
	$Timer.start()
	yield($Timer, "timeout")
	var debug = "res://scenes/Rooms_00-02.tscn"
	get_tree().change_scene(debug)







