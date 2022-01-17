extends Control

var enemy = preload("res://Entities/Enemy/Enemy.tscn")
onready var scoreLabel = $HUD/ScoreLabel
onready var levelLabel = $HUD/LevelLabel

var spawnPoint
var spawnColor
var spawnMidX
onready var spawnTimer = $Timer
var enemySpeed :float = 10

var color

func _ready():
	GAMESTATS.connect("score_label", self, "_set_label")
	GAMESTATS.connect("level_label", self, "_set_level_label")
	scoreLabel.text = str(GAMESTATS.score)
	levelLabel.text = "Level "+ str(GAMESTATS.level)
	GAMESTATS.score = 0
	GAMESTATS.levelTimer.wait_time = 10
	GAMESTATS.levelTimer.start()
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
	spawnTimer.wait_time -= 0.01

func _reset():
	if(GAMESTATS.score > GAMESTATS.highScore):
		GAMESTATS.highScore = GAMESTATS.score
	GAMESTATS.level = 1
	GAMESTATS.levelTimer.stop()
	get_tree().change_scene("res://Scenes/Menu/Menu.tscn")

func _set_label(score):
	scoreLabel.text = str(score)

func _set_level_label(level):
	levelLabel.text = "Level " + str(level)

func _on_HurtBox_area_entered(area):
	_reset()
