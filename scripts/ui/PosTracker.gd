extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export(NodePath) var player

# Called when the node enters the scene tree for the first time.

func _ready():
	player = get_node(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(player.linear_velocity)
