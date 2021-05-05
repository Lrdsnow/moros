extends Node

func _ready():
		var _play_pressed = $play.connect("pressed", self, "_on_play_pressed")
# When a Host button is pressed
func _on_play_pressed():
# warning-ignore:return_value_discarded
	var cs = "res://scenes/new-lev1.tscn"
	get_tree().change_scene(cs)
	
func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		var lev1 = "res://scenes/new-lev1.tscn"
		get_tree().change_scene(lev1)
	if Input.is_action_pressed("debug"):
		var debug = "res://scenes/Room_01.tscn"
		get_tree().change_scene(debug)
	if Input.is_action_pressed("epic"):
		var epic = "res://scenes/EPIC.tscn"
		get_tree().change_scene(epic)
