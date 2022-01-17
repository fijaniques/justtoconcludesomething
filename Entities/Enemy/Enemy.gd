extends RigidBody2D

var color
var spawnColor

enum {
	RED,
	GREEN,
	BLUE
}

var rightColor : bool

var speed : int = 300
var getMidX : float

func _ready():
	speed = clamp(speed * GAMESTATS.level / 1.70, 300, 999999999)
	position.x += getMidX
	position.y -= 300
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

func _on_HurtBox_area_entered(area):
	if(area.get_parent().state == color):
		GAMESTATS.score += 10
		area.get_parent().queue_free()
		queue_free()
	elif(area.get_parent().state != color):
		GAMESTATS.score -= 5
		area.get_parent().queue_free()
