extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(ScoreManager.get_score())
	ScoreManager.reset_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://mainscenes/Main.tscn")
		queue_free()
