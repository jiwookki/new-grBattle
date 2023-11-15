extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export var border_offset = 362
export var border_x = 612

var minX: int
var maxX: int
var minY: int
var maxY: int


func _get_self_sprite():
	return get_node("./Sprite")

# Called when the node enters the scene tree for the first time.
func _init_boundary():
	var _objSprite = _get_self_sprite()
	minX = border_offset + _objSprite.texture.get_width()/2
	maxX = border_offset + border_x - _objSprite.texture.get_width()/2 
	minY = _objSprite.texture.get_height()/2
	maxY = - _objSprite.texture.get_height()/2 + get_viewport_rect().size.y
	print(str(minX))
	print(str(maxX))
	print(str(minY))
	print(str(maxY))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _keep_boundary():
	position.x = clamp(position.x, minX, maxX)
	position.y = clamp(position.y, minY, maxY)
	
