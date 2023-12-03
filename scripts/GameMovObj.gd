extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal on_despawn

var minX = -1000
var maxX = 1000
var minY = -1000
var maxY = 1000


func _get_self_sprite():
	return get_node("./Sprite")

# Called when the node enters the scene tree for the first time.
func _init_boundary():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _keep_boundary():
	position.x = clamp(position.x, minX, maxX)
	position.y = clamp(position.y, minY, maxY)
	
