extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var fall_speed : float

export var knockback : int

export var damage : int

var _max_y : int

# Called when the node enters the scene tree for the first time.
func _ready():
	_max_y = get_viewport_rect().size.y + get_node("./Sprite").texture.get_height() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += fall_speed * delta
	if position.y > _max_y:
		emit_signal("tree_exiting", true)
		queue_free()
		



func _on_Asteroid_area_entered(area):
	if area.is_in_group("player"):
		print("dead")
		queue_free()
	elif area.is_in_group("player_bullet"):
		print("knocked")
		position.y -= knockback
