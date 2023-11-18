extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export var fall_speed : float

export var knockback : int

export var damage : int

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_boundary()
	minY = -200
	maxY = get_viewport_rect().size.y + get_node("./Sprite").texture.get_height() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += fall_speed * delta
	if position.y > maxY:
		emit_signal("on_despawn", true)
		queue_free()
	_keep_boundary()



func _on_Asteroid_area_entered(area):
	if area.is_in_group("player"):
		print("dead")
		queue_free()
	elif area.is_in_group("player_bullet"):
		print("knocked")
		position.y -= knockback
