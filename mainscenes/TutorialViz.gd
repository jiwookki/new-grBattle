extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var viz_displacement : int

var initialPosition: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	initialPosition = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = initialPosition + Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down") * viz_displacement
