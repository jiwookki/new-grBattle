extends Node2D




signal update_ammo_count

export var max_ammo = 8

export var reload_time_seconds: float

export var shoot_cooldown_secs : float

export var shoot_speed : Vector2

var ammo = max_ammo

var cooldown = 0

var bullet_prefab : PackedScene

var root : Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _reload():
	ammo = max_ammo + 1
	cooldown = reload_time_seconds
	emit_signal("update_ammo_count", "Reloading")

func _shoot():
	ammo -= 1
	emit_signal("update_ammo_count", ammo)
	if ammo <= 0:
		_reload()
	else: 
		cooldown = shoot_cooldown_secs
	var newbullet = bullet_prefab.instance()
	newbullet.startShoot(shoot_speed, global_position)
	root.add_child(newbullet)
	
		
func _process_cooldown(delta):
	if cooldown > 0:
		cooldown -= delta
	elif ammo == max_ammo + 1:
		print("max")
		ammo -= 1
		emit_signal("update_ammo_count", ammo)






# Called when the node enters the scene tree for the first time.
func _ready():
	
	emit_signal("update_ammo_count", ammo)
	print("gun init")
	bullet_prefab = preload("res://Bullet.tscn")
	root = get_node("/root")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_process_cooldown(delta)
	if Input.is_action_pressed("player_shoot") and cooldown <= 0:
		_shoot()

