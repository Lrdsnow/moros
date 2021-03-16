extends Area2D

func _on_Area2D_area_entered(_CollisionShape2D):
	var change = "res://scenes/main.tscn"
	get_tree().change_scene(change)
	print('collison')
