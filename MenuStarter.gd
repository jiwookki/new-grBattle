extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var game

func _ready():
	game = preload("res://mainscenes/Game.tscn")
	

func start_game():
	get_tree().change_scene_to(game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		text = "Loading..."
		start_game()
