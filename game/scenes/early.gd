extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var _lev1_pressed = $lev1.connect("pressed", self, "_on_lev1_pressed")
	var _lev2_pressed = $lev2.connect("pressed", self, "_on_lev2_pressed")
	var _lev3_pressed = $lev3.connect("pressed", self, "_on_lev3_pressed")
	var _epic_pressed = $epic.connect("pressed", self, "_on_epic_pressed")
	var _room00_pressed = $Room_03.connect("pressed", self, "_on_room00_pressed")
	var _room03dnu_pressed = $Room_03_DNU.connect("pressed", self, "_on_room03dnu_pressed")
	var _cs_pressed = $CS.connect("pressed", self, "_on_cs_pressed")
	var _back_pressed = $back.connect("pressed", self, "_on_back_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_lev1_pressed():
	var early = "res://scenes/lev1.tscn"
	get_tree().change_scene(early)
	
func _on_lev2_pressed():
	var early = "res://scenes/lev2.tscn"
	get_tree().change_scene(early)
	
func _on_lev3_pressed():
	var early = "res://scenes/lev3.tscn"
	get_tree().change_scene(early)
	
func _on_epic_pressed():
	var early = "res://scenes/EPIC.tscn"
	get_tree().change_scene(early)
	
func _on_room03dnu_pressed():
	var early = "res://scenes/Room_03_DNU.tscn"
	get_tree().change_scene(early)

func _on_cs_pressed():
	var cs = "res://scenes/CS.tscn"
	get_tree().change_scene(cs)
	
func _on_back_pressed():
	var menu = "res://scenes/menu.tscn"
	get_tree().change_scene(menu)

func _on_room00_pressed():
	var early = "res://scenes/Room_00.tscn"
	get_tree().change_scene(early)
