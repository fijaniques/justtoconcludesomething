extends Control

onready var highScore = $VBoxContainer/HighScore
onready var playBtn = $VBoxContainer/PLAY
onready var quitBtn = $VBoxContainer/QUIT

func _ready():
	highScore.text = str(GAMESTATS.highScore)

func _on_PLAY_pressed():
	get_tree().change_scene("res://Scenes/Game/GameWindow.tscn")

func _on_HOWTO_pressed():
	get_tree().change_scene("res://Scenes/HowToPlay/HowToPlay.tscn")

func _on_QUIT_pressed():
	get_tree().quit()


