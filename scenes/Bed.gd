extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal save

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(relate):
	emit_signal("save")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
