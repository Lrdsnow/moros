extends CollisionShape2D

func get_input():
	if Input.is_action_pressed("p2join"):
		$CollisionShape2D.disabled = true
