extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var high_score_node

export(NodePath) var date_time_node


var _highscore: Node

var _datetime: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	_highscore = get_node(high_score_node)
	_datetime = get_node(date_time_node)
	
	text = str(ScoreManager.get_score())

	
	if ScoreManager.is_new_high() == true:
		
		_highscore.text = "New high score!"
		ScoreManager.save_high_score(ScoreManager.get_score())
		
	else:
		
		_highscore.text = "High score: " + str(ScoreManager.get_high_score())
		
	_datetime.text = ScoreManager.get_high_score_date()
	ScoreManager.reset_score()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://mainscenes/Main.tscn")
		queue_free()
