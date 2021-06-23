extends KinematicBody2D

export (int) var speed = 1000
export (int) var jump_speed = -1500
export (int) var gravity = 2500

var velocityp2 = Vector2.ZERO

func _physics_process(delta):
	get_input()
	velocityp2.y += gravity * delta
	velocityp2 = move_and_slide(velocityp2, Vector2.UP)
	if Input.is_action_just_pressed("p2jump"):
		if is_on_floor():
			velocityp2.y = jump_speed
			
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

func get_input():
	var dirp2 = 0
	if Input.is_action_pressed("p2right"):
		dirp2 += 1
	if Input.is_action_pressed("p2join"):
		show()
	if Input.is_action_pressed("p2left"):
		dirp2 -= 1
	if dirp2 != 0:
		velocityp2.x = lerp(velocityp2.x, dirp2 * speed, acceleration)
	else:
		velocityp2.x = lerp(velocityp2.x, 0, friction)
