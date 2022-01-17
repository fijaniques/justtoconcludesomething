extends RigidBody2D

var color :int
var speed = 5000

enum {
	RED,
	GREEN,
	BLUE,
}

var state

func _ready():
	if(color == 1):
		state = RED
	elif(color == 2):
		state = GREEN
	else:
		state = BLUE
	
	match state:
		RED:
			modulate = Color(1, 0, 0)
		GREEN:
			modulate = Color(0, 1, 0)
		BLUE:
			modulate = Color(0, 0, 1)

func _physics_process(delta):
	position.y -= speed * delta
