extends Node

class_name HealthTracker


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal on_health_change

export var starting_health  : int

var health : int


# Called when the node enters the scene tree for the first time.
func _ready():
	health = starting_health
	emit_signal("on_health_change", health) # Replace with function body.

func take_damage(dmg):
	health -= dmg
	
	
	
	

func die():
	get_parent().queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		die()
