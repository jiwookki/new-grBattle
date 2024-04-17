extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var fall_speed_max : float
export var fall_speed_min: float

export var fall_accel: float

onready var target_fall_speed = rand_range(fall_speed_min, fall_speed_max)

var fall_velocity = 0

export var knockback : int

export var damage : int

var blockSound

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_boundary()
	minY = -200
	maxY = get_viewport_rect().size.y + get_node("./Sprite").texture.get_height() / 2
	blockSound = get_node("./AsteroidBlockSound")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fall_velocity = lerp(fall_velocity, target_fall_speed, delta * fall_accel)
	position.y += fall_velocity * delta
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
		fall_velocity = knockback
		blockSound.play()
