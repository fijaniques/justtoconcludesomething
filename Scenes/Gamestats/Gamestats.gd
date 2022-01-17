extends Node2D

var highScore :int
var score :int setget _set_score
var level :int setget _set_level

onready var levelTimer = $LevelUp

signal score_label
signal level_label

func _ready():
	self.level = 1

func _set_score(value):
	score = value
	emit_signal("score_label", score)

func _set_level(value):
	level = value

func _on_LevelUp_timeout():
	self.level += 1
	levelTimer.wait_time -= 0.3
	emit_signal("level_label", level)
