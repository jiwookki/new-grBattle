extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var speed : float

export var turn_speed : float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_central_impulse(delta * speed * Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down"))
	print(rad2deg(-rotation-(get_global_mouse_position() - position).angle_to(Vector2.UP)))
	apply_torque_impulse((-rotation - (get_global_mouse_position() - position).angle_to(Vector2.UP)) * turn_speed)
	
