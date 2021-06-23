extends Area2D

func _on_p_body_entered(body):
	var cs = "res://scenes/CS.tscn"
	get_tree().change_scene(cs)
