extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var speed : float

export var turn_speed : float

var delta_angle : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _get_target_angle_delta():
	delta_angle = -rotation-(get_global_mouse_position() - position).angle_to(Vector2.UP)
	if abs(delta_angle) > PI:
		if delta_angle > 0:
			return delta_angle - TAU
		else:
			return delta_angle + TAU
	else:
		return delta_angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_central_impulse(delta * speed * Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down"))
	apply_torque_impulse(_get_target_angle_delta() * turn_speed)
	
