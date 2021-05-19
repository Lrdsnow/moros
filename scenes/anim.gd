extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal playanim

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("playanim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://scenes/temp.tscn")
