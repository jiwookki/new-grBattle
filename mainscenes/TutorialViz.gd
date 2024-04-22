extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var viz_displacement : int

export var viz_dash : int

onready var initialPosition = position

var _dash = 0
var _input = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	_input =  Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	
	_dash = Input.get_axis("dash_left", "dash_right")
	
	if _dash != 0:
		position = Vector2(_dash * viz_dash + initialPosition.x, initialPosition.y)
	else:
		position = _input * viz_displacement + initialPosition
	
