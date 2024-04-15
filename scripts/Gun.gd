

class_name Gun

extends Node2D



signal on_shot


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


func _on_ammo_change(newammo):
	pass # override

func _on_start_reload():
	pass # override
	
func _on_finish_reload():
	pass # override



func _reload():
	ammo = max_ammo + 1
	cooldown = reload_time_seconds

func _shoot():
	if cooldown <= 0:
		_force_shoot()


func _force_shoot():
		ammo -= 1
		emit_signal("on_shot")
		_on_ammo_change(ammo)
		if ammo <= 0:
			_on_start_reload()
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
		ammo -= 1
		_on_finish_reload()






# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_prefab = preload("res://gamescenes/Bullet.tscn")
	root = get_node("/root/Game")
		
		
func _gun_process(delta):
	pass # override 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_gun_process(delta)
	_process_cooldown(delta)



