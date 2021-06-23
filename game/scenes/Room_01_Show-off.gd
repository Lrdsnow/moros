extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.set_window_fullscreen(!OS.window_fullscreen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
