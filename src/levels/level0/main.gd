extends Node2D

@export var player:PackedScene
@export var clear_color:Color

func _ready():
	RenderingServer.set_default_clear_color(clear_color)
	var player_inst = player.instantiate()
	$spawn.add_child(player_inst)
