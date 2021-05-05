extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	hide()

# Called when the node enters the scene tree for the first ti


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_player_pause():
	show()
	OS.delay_msec(500)
	hide()
