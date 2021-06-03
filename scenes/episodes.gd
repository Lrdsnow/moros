extends Control

var epsel = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$note.hide()
	$play.disabled = true
	$episode1.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ep1_pressed():
	if GameData.ep1path <= 1:
		$note.show()
	if GameData.episode == 2:
		$episode1/CheckBox.pressed = true
	$play.disabled = false
	$episode1.show()
	epsel = 1


func _on_play_pressed():
	if epsel == 1:
		var cs = "res://scenes/new-lev1.tscn"
		get_tree().change_scene(cs)
		

