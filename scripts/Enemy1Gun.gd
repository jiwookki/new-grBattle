extends Gun


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	bullet_prefab = preload("res://gamescenes/EnemyBullet.tscn")
	root = get_node("/root")


# Called when the node enters the scene tree for the first time.
func _gun_process(_delta):
	_shoot()