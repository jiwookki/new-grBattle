 extends KinematicBody2D

class_name BasicBullet


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
var _new_collision : KinematicCollision2D


func startShoot(new_velocity, new_position, new_angle):
	_velocity = new_velocity
	global_position = new_position
	
	rotation = new_angle
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	_current_lifetime += delta
	
	_new_collision = move_and_collide(_velocity * delta, false)
	if _new_collision != null:
		if _new_collision.collider.is_in_group(damaging_group):
			self._on_hit(_new_collision.collider)
			_new_collision.collider._on_bullet_collide(self)

	if _current_lifetime >= lifetime:
		queue_free()

func _on_hit(object):
		_current_pierced += 1
		object._on_bullet_collide(self)
		
		
		if _current_pierced >= piercing:
			print("queue_free")
			queue_free()

func get_contact_damage():
	return damage # override for any special bullet damage
