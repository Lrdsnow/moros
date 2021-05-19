extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate.a = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$splash.stop()
		self_modulate.a = 0


func _on_Control_splash():
	self_modulate.a = 100
	$splash.play("fade")
