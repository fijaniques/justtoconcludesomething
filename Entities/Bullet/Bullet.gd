extends RigidBody2D

var color
var speed = 2000

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
			$HitBox.set_collision_mask_bit(3, true)
			modulate = Color(1, 0, 0)
		GREEN:
			$HitBox.set_collision_mask_bit(4, true)
			modulate = Color(0, 1, 0)
		BLUE:
			$HitBox.set_collision_mask_bit(5, true)
			modulate = Color(0, 0, 1)

func _physics_process(delta):
	position.y -= speed * delta
