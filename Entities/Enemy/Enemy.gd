extends RigidBody2D

var color
var spawnColor

enum {
	RED,
	GREEN,
	BLUE
}

var speed = 300
var getMidX : float

func _ready():
	position.x += getMidX
	_set_color()
	match color:
		RED:
			modulate = Color(1, 0, 0)
		GREEN:
			modulate = Color(0, 1, 0)
		BLUE:
			modulate = Color(0, 0, 1)

func _physics_process(delta):
	position.y += speed * delta

func _set_color():
	if(spawnColor == 1):
		color = RED
	elif(spawnColor == 2):
		color = GREEN
	else:
		color = BLUE

func _on_Enemy_body_entered(body):
	queue_free()
