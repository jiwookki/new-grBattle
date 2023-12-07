extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var resume_button

func on_pause():
	if visible:
		resume_button.grab_focus()

# Called when the node enters the scene tree for the first time.
func _ready():
	resume_button = get_node("./ResumeButton")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
