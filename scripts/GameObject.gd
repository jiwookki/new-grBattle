extends RigidBody2D


class_name GameObject

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var health_tracker_path

export var contact_damage : float

export var bullet_group : String # the GameObject will take damage from this bullet group

export var GameObject_damage_group : String # the GameObject will take damage from this group

export var defense : float

export var max_energy : float 

export var relativity_multiplier : int

var health_tracker

var energy : float


# Called when the node enters the scene tree for the first time.
func _ready():
	health_tracker = get_node(health_tracker_path)

func get_final_damage(damage):
	return damage * defense # override (for defense calculations, etc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _get_relativity(force, velocity=linear_velocity):
	
	var magnitude = force.length_squared()
	
	if magnitude == 0:
		return 0
	else:
		return -(relativity_multiplier)/(magnitude + relativity_multiplier) + 1
	

func get_contact_damage():
	return contact_damage

func _on_GameObject_collide(object):
	health_tracker.take_damage(get_final_damage(object.get_contact_damage()))

func _on_bullet_collide(bullet):
	health_tracker.take_damage(get_final_damage(bullet.get_contact_damage()))
	
