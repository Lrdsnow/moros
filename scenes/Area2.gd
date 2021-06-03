extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GameData.ep1path = 1
	GameData.episode = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_light():
	$AnimationPlayer.play("light")

func _on_end2_animation_finished(anim_name):
	save_level()
	var cs = "res://scenes/menu.tscn"
	get_tree().change_scene(cs)

func load_level():
	var save_file = File.new()
	if not save_file.file_exists("user://other.save"):
		return
	save_file.open("user://other.save", File.READ)
	GameData.episode = int(save_file.get_line())
	GameData.ep1path = int(save_file.get_line())
	save_file.close()

func save_level():
	var save_file = File.new()
	save_file.open("user://other.save", File.WRITE)
	save_file.store_line(str(GameData.episode))
	save_file.store_line(str(GameData.ep1path))
	save_file.close()
