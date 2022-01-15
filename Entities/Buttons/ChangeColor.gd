extends Button

var currentColor = 1
var color

signal color_signal

func _ready():
	emit_signal("color_signal", currentColor)

func _pressed():
	if(currentColor < 3):
		currentColor += 1
	else:
		currentColor = 1
	
	emit_signal("color_signal", currentColor)
