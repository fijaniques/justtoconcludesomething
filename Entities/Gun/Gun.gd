extends TextureButton

var bullet = preload("res://Entities/Bullet/Bullet.tscn")
var middleX

var color = 1

signal color_signal

func _ready():
	get_tree().current_scene.get_node("VBox/ChangeColor").connect("color_signal", self, "_get_color")
	modulate = Color(1, 0, 0)
	middleX = rect_size.x / 2

func _pressed():
	emit_signal("color_signal", color)
	var bulletInstance = bullet.instance()
	bulletInstance.color = color
	get_tree().current_scene.add_child(bulletInstance)
	var pos = Vector2(get_global_rect().position.x, get_global_rect().position.y)
	var posOffset = rect_size.x / 2

	bulletInstance.position = Vector2(pos.x + posOffset, pos.y)

func _get_color(a):
	if(a == 1):
		color = 1
		modulate = Color(1, 0, 0)
	elif(a == 2):
		color = 2
		modulate = Color(0, 1, 0)
	else:
		color = 3
		modulate = Color(0, 0, 1)
