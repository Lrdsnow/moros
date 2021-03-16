extends Area2D

func _on_area_entered (door):
	get_tree().change_scene("res://scenes/menu.tscn")
