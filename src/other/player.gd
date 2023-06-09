extends CharacterBody2D

@export var speed = 1200
@export var jump_speed = -1800
@export var gravity = 4000

func _ready():
	pass

func _process(delta):
	pass

func _input(event):
	if event is InputEventKey or event is InputEventJoypadButton or event is InputEventJoypadMotion:
		if event.is_action_pressed("jump"):
			pass
		elif event.is_action_pressed("ui_left"):
			$tex.flip_h=true
			$tex.play("walking")
		elif event.is_action_pressed("ui_right"):
			$tex.flip_h=false
			$tex.play("walking")
		elif event.is_action_released("ui_left") or event.is_action_released("ui_right"):
			$tex.play("idle")


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	move_and_slide()
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
