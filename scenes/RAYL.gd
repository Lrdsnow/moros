extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
  # use global coordinates, not local to node
	var result = space_state.intersect_ray(Vector2(0, 0), Vector2(50, 100))
	if result:
		emit_signal("dL")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
