extends Control

var enemy = preload("res://Entities/Enemy/Enemy.tscn")

var spawn
onready var spawnTimer = $Timer

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn = int(rand_range(1,4))
	var enemyInstance = enemy.instance()
	get_node("VBox/Spawners/Spawn" + str(spawn)).add_child(enemyInstance)
