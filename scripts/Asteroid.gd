extends BasicBullet


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



export var fall_speed : float

export var knockback : int

var blockSound

# Called when the node enters the scene tree for the first time.
func _ready():
	blockSound = get_node("./AsteroidBlockSound")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += fall_speed * delta



func _on_Asteroid_area_entered(area):
	if area.is_in_group("player"):
		print("dead")
		queue_free()
	elif area.is_in_group("player_bullet"):
		print("knocked")
		position.y -= knockback
		blockSound.play()
