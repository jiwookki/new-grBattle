extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal score_changed


export var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("score_changed", score)

func change_score(score_delta):
	score += score_delta
	emit_signal("score_changed", score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
