extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var open = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_arrow_pressed():
	if open == 0:
		$move.play("move")
		open = 1
		$arrow.text = "<"
	else:
		if open == 1:
			$move.play_backwards("move")
			open = 0
			$arrow.text = ">"


func _on_Button_pressed():
	OS.shell_open("https://lrdsnow.itch.io/moros-dev")
