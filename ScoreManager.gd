extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_score():
	return score
	
func change_score(score_delta):
	score += score_delta
	
func reset_score():
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass