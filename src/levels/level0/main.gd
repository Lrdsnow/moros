extends Node2D

@export var player:PackedScene

func _ready():
	var player_inst = player.instantiate()
	$spawn.add_child(player_inst)
