extends Area2D
func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_flip_body_entered")

func _on_flip_body_entered(_body3):
	print('oh me me')
