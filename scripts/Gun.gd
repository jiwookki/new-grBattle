

class_name Gun

extends Node2D



signal on_shot


export var max_ammo = 8

export var reload_time_seconds: float

export var shoot_cooldown_secs : float

export var shoot_speed : float

export var shoot_direction : Vector2

export(PackedScene) var bullet_prefab

var ammo = max_ammo

var cooldown = 0

var root : Node

var newBullets = 0



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


func _launch_bullet(newbullet):
	newbullet.startShoot(shoot_speed * shoot_direction, global_position, Vector2.UP.angle_to(shoot_direction))

func _force_shoot():
		ammo -= 1
		emit_signal("on_shot")
		_on_ammo_change(ammo)
		if ammo <= 0:
			_on_start_reload()
			_reload()
		else: 
			cooldown = shoot_cooldown_secs
		newBullets += 1


		
func _process_cooldown(delta):
	if cooldown > 0:
		cooldown -= delta
	elif ammo == max_ammo + 1:
		ammo -= 1
		_on_finish_reload()






# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_node("/root/Game")
		
		
func _gun_process(delta):
	pass # override 
	
func _clear_bullet_queue():
	for x in range(0, newBullets):
		var newBullet = bullet_prefab.instance()
		_launch_bullet(newBullet)
		root.add_child(newBullet)
	newBullets = 0
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_gun_process(delta)
	_clear_bullet_queue()
	_process_cooldown(delta)



