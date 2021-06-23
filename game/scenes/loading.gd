extends Control


onready var load_stuff = Thread.new()
var current_scene="res://scenes/new-menu.tscn"
var path="res://scenes/new-lev1.tscn"
#new_scene here is a node and loading is a boolean

func _ready():
	prep_scene()

#new_scene here is a node and loading is a boolean
func goto_scene(new_scene,loading):
	current_scene.queue_free()
	current_scene=new_scene
	# Add new scene as child of root
	get_tree().get_root().call_deferred("add_child",current_scene)
	# optional, to make it compatible with the SceneTree.change_scene() API
	get_tree().set_current_scene( current_scene )
	# if we are using the loading scene then we want a thread to prep next scene
	if(loading):
		load_stuff.start(self,"prep_scene")

func prep_scene():
	#your code for setting up the next scene goes here
	var s = ResourceLoader.load(path)
	var scene= s.instance()
	#make sure if add_child function is used anywhere during the thread you use call deferred since add_child() is not very thread safe, look at the goto_scene for an example of this.
	#once the new scene is prepared we can switch to it, also set false since we aren't doing the loading screen again
	goto_scene(scene,true)
	load_stuff.call_deferred('wait to finish')
