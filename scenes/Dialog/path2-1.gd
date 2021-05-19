extends Spatial

var episode = GameData.episode
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	episode = 2
	GameData.ep1path = 2
	save_level()
	$AnimationPlayer.play("def")




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	var debug = "res://scenes/menu.tscn"
	get_tree().change_scene(debug)


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
