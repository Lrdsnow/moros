extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal lock
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(relate):
	emit_signal("lock")
