extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lifetime : float

var _velocity : Vector2
var _current_lifetime = 0

func startShoot(new_velocity, new_position):
	_velocity = new_velocity
	position = new_position
	print(position)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_current_lifetime += delta
	if _current_lifetime >= lifetime:
		queue_free()
	position += _velocity * delta
