extends CanvasLayer

var highScore :int
var score :int setget _set_score
var level :int

signal score_label

func _set_score(value):
	score = value
	emit_signal("score_label", score)
