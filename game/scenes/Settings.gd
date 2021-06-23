extends Control


func _on_graphics_pressed():
	var cs = "res://scenes/Graphics.tscn"
	get_tree().change_scene(cs)

func _on_early_pressed():
	var cs = "res://scenes/early.tscn"
	get_tree().change_scene(cs)
