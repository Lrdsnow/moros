tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("Ben", "KinematicBody2D", preload("ben.gd"), preload("ben.png"))

func _exit_tree():
	remove_custom_type("Ben")
