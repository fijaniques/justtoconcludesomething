extends Control

var enemy = preload("res://Entities/Enemy/Enemy.tscn")

var spawnPoint
var spawnColor
var spawnMidX
onready var spawnTimer = $Timer
var enemySpeed :float = 10

func _ready():
	randomize()
	_spawn_enemy()

func _spawn_enemy():
	spawnPoint = int(rand_range(1,4))
	spawnMidX = get_node("VBox/Spawners/Spawn" + str(spawnPoint)).rect_size.x / 2
	
	var enemyInstance = enemy.instance()
	enemyInstance.getMidX = spawnMidX
	enemyInstance.spawnColor = int(rand_range(1,4))
	get_node("VBox/Spawners/Spawn" + str(spawnPoint)).add_child(enemyInstance)
	

func _on_Timer_timeout():
	_spawn_enemy()
