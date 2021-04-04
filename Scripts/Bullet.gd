extends Area2D

var speed = 750

func _ready():
	connect("body_entered", self, "_on_Bullet_body_entered")

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
