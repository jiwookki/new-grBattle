extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal score_changed

signal game_over



# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("score_changed", ScoreManager.get_score())

func change_score(score_delta):
	ScoreManager.change_score(score_delta)
	
	emit_signal("score_changed", ScoreManager.get_score())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_game_over():
	emit_signal("game_over")

	
	

func faded_out(anim_name):
	get_tree().change_scene("res://mainscenes/GameOver.tscn")
	queue_free()
