extends TextureButton

var bullet = preload("res://Entities/Bullet/Bullet.tscn")
var middleX

func _ready():
	middleX = rect_size.x / 2

func _pressed():
	var bulletInstance = bullet.instance()
	add_child(bulletInstance)
	bulletInstance.position.x = middleX
