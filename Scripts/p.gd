extends Area2D
func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_p_body_entered")

func _on_p_body_entered(_body):
	var cs = "res://scenes/Dialog/1.tscn"
# warning-ignore:return_value_discarded
	get_tree().change_scene(cs)
