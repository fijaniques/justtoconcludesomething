extends Control

var enemy = preload("res://Entities/Enemy/Enemy.tscn")

var spawn
var spawnColor
onready var spawnTimer = $Timer
var enemySpeed :float = 10

func _ready():
	randomize()
	
	_spawn_enemy()

func _spawn_enemy():
	spawn = int(rand_range(1,4))
	spawnColor = int(rand_range(1,4))
	var enemyInstance = enemy.instance()
	enemyInstance.spawnColor = spawnColor
	get_node("VBox/Spawners/Spawn" + str(spawn)).add_child(enemyInstance)

func _on_Timer_timeout():
	_spawn_enemy()
