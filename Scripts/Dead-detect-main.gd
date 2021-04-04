extends Area2D
func _on_dead_body_entered(_body):
	var ded = "res://scenes/Dead.tscn"
# warning-ignore:return_value_discarded
	get_tree().change_scene(ded)
