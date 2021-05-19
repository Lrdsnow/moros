extends Control

func _ready():
	var _VsyncOff_pressed = $VsyncOff.connect("pressed", self, "_on_VsyncOff_pressed")
	var _VsyncOn_pressed = $VsyncOn.connect("pressed", self, "_on_VsyncOn_pressed")

	
func _on_exit_pressed():
	var cs = "res://scenes/Settings.tscn"
	get_tree().change_scene(cs)

func _on_VsyncOn_pressed():
	$VsyncOn.hide()
	$VsyncOff.show()
	OS.set_use_vsync(false)

func _on_VsyncOff_pressed():
	$VsyncOff.hide()
	$VsyncOn.show()
	OS.set_use_vsync(true)

func _on_early_pressed():
	var cs = "res://scenes/early.tscn"
	get_tree().change_scene(cs)
