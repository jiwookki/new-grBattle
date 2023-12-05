extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

func _on_ready():
	grab_focus()

func start_game():
	get_tree().change_scene("res://mainscenes/Tutorial.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func button_pressed():
		print("started")
		text = "Loading..."
		start_game()
