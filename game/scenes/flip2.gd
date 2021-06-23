extends Area2D
func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_flip2_body_entered")

func _on_flip2_body_entered(_body2):
	print("meh")
	

