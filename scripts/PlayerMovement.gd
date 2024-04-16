extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var max_speed = 200.0

export var lerp_rate = 5.0

var _velocity = Vector2(0, 0)

var _accel = Vector2(0, 0)

onready var _max_velocity = Vector2(max_speed, max_speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_boundary()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_accel = Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	_velocity = _velocity.linear_interpolate(_accel * max_speed, delta*lerp_rate)
	position += _velocity
	_keep_boundary()
	
func _init_boundary():
	var _objSprite = _get_self_sprite()
	minX = border_offset + 40
	maxX = border_x + border_offset - 40 
	minY = 40
	maxY = -40 + get_viewport_rect().size.y
	print(str(minX))
	print(str(maxX))
	print(str(minY))
	print(str(maxY))

