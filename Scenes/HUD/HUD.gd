extends CanvasLayer

onready var scoreLabel = $Score

var highScore :int
var score :int setget _set_score
var level :int

func _ready():
	scoreLabel.text = str(score)

func _process(delta):
	scoreLabel.text = str(score)

func _set_score(value):
	score = value
	scoreLabel.text = str(score)
