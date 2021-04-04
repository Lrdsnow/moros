extends KinematicBody2D

export (int) var speed = 500
export (int) var jump_speed = -900
export (int) var gravity = 2500

var velocity = Vector2.ZERO


func _on_KinematicBody2D_body_entered(_CollisionShape2D):
	var change = "res://scenes/main.tscn"
# warning-ignore:return_value_discarded
	get_tree().change_scene(change)
	print('')
	
func _on_Player_body_entered(_body):
	hide() # Player disappears after being hit.
	emit_signal("hit")
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)
	print('hi')

func instance():
	pass

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
			
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

func get_input():
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
