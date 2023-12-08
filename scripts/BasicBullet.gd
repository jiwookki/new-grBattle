 extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lifetime : float

export var damage : int

export var piercing : int

export var damaging_group : String

var _velocity : Vector2
var _current_lifetime = 0
var _current_pierced = 0

func startShoot(new_velocity, new_position, new_angle):
	_velocity = new_velocity
	global_position = new_position
	linear_velocity = new_velocity
	
	rotation = new_angle
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_current_lifetime += delta
	if _current_lifetime >= lifetime:
		queue_free()

func _on_hit(area):
	if area.is_in_group(damaging_group):
		_current_pierced += 1
		linear_velocity = _velocity
		
		if _current_pierced >= piercing:
			queue_free()
