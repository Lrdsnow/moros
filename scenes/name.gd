extends LineEdit

onready var playerdata = get_node("/root/PlayerData")

func _text_entered(new_text):
	playerdata.player_name = new_text.text
