extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var player

# Called when the node enters the scene tree for the first time.

func _ready():
	player = get_node("/root/Game/Delta1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(player.position)
