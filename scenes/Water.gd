extends Area2D
func _ready():
# warning-ignore:return_value_discarded
	connect("body_entered", self, "_on_water_body_entered")
