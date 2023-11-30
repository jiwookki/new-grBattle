extends Gun


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	root = get_node("/root")


# Called when the node enters the scene tree for the first time.
func _gun_process(delta):
	
	_shoot()
