extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var player_ref: NodePath

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_ref)
	
func _physics_process(delta):
	text = str(int(player.fuel * 1000))
