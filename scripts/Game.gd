extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal score_changed

export(NodePath) var player_node

var player
var tree

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("score_changed", ScoreManager.get_score())
	tree = get_tree()
	player = get_node(player_node)

func change_score(score_delta):
	ScoreManager.change_score(score_delta)
	
	emit_signal("score_changed", ScoreManager.get_score())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_player_node():
	return player


func on_game_over():
	get_node("./MusicPlayer").stop()
	get_node("./FadeOut").play("FadeOut")
	
func _input(event):
	if event.is_action_pressed("game_pause"):
		tree.paused = not tree.paused


func faded_out(anim_name):
	get_tree().change_scene("res://mainscenes/GameOver.tscn")
	queue_free()
