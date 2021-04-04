extends Area2D
func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_Wall_body_entered")

func _on_p_body_entered(_body):
	pass();
