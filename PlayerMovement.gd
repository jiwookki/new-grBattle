extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var player_speed = 10


var _velocity = Vector2(0, 0)



# Called when the node enters the scene tree for the first time.
func _ready():
	_init_boundary()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_velocity = Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down") * player_speed * delta
	position.x += _velocity.x
	position.y += _velocity.y
	_keep_boundary()
	
