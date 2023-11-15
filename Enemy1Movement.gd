extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed : float
export var max_offset : float

var player : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Game/Delta1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.x > position.x + max_offset:
		position.x += speed * delta
	elif player.position.x < position.x - max_offset:
		position.x -= speed * delta
