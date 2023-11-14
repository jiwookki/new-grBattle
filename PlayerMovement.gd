extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var player_speed = 10

export var border_offset = 362
export var border_x = 612

var _velocity = Vector2(0, 0)



var minX: int
var maxX: int
var minY: int
var maxY: int


# Called when the node enters the scene tree for the first time.
func _ready():
	var _playerSprite = get_node("./Sprite")
	minX = border_offset + _playerSprite.texture.get_width()/2
	maxX = border_offset + border_x - _playerSprite.texture.get_width()/2 
	minY = _playerSprite.texture.get_height()/2
	maxY = - _playerSprite.texture.get_height()/2 + get_viewport_rect().size.y
	print(str(minX))
	print(str(maxX))
	print(str(minY))
	print(str(maxY))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_velocity = Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down") * player_speed * delta
	position.x = clamp(position.x + _velocity.x, minX, maxX)
	position.y = clamp(position.y + _velocity.y, minY, maxY)
	
