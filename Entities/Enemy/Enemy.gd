extends RigidBody2D

var color
var spawnColor

enum {
	RED,
	GREEN,
	BLUE
}

var rightColor : bool

var speed = 300
var getMidX : float

func _ready():
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
		$HurtBox.set_collision_layer_bit(3, true)
	elif(spawnColor == 2):
		color = GREEN
		$HurtBox.set_collision_layer_bit(4, true)
	else:
		color = BLUE
		$HurtBox.set_collision_layer_bit(5, true)

func _on_HurtBox_area_entered(area):
	if(area.name == "HitBox"):
		rightColor = true
		GAMESTATS.score += 10
		area.get_parent().queue_free()
		queue_free()
	else:
		if(!rightColor):
			GAMESTATS.score -= 5
			area.get_parent().queue_free()
