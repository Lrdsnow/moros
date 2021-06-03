
extends StaticBody

var animating = false

const CLOSED = 0
const OPEN = 1

signal open
signal close

export var locked = false
var state = CLOSED

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func interact(relate):
	if !animating:
		if state == CLOSED:
			$AnimationPlayer.play("open")
			emit_signal("open")
		else:
			$AnimationPlayer.play_backwards("open")
			emit_signal("close")

func _on_AnimationPlayer_animation_finished(anim_name):
	animating = false

	if state == OPEN:
		state = CLOSED
	else:
		state = OPEN


func _on_AnimationPlayer_animation_started(anim_name):
	animating = true


func _on_Door_close():
	$AnimationPlayer.play("close")
	
func _on_Door_open():
	$AnimationPlayer.play_backwards("open")
