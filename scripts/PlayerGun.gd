

extends Gun

signal update_ammo_count

signal reloading
signal finish_reloading

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var shootSounder

func _force_shoot():
	shootSounder.play()
	._force_shoot()

func _on_start_reload():
	emit_signal("update_ammo_count", 0)
	emit_signal("reloading", reload_time_seconds)

func _on_finish_reload():
	emit_signal("update_ammo_count", ammo)
	emit_signal("finish_reloading")
	

func _on_ammo_change(newammo):
	emit_signal("update_ammo_count", newammo)


# Called when the node enters the scene tree for the first time.
func _ready():
	
	emit_signal("update_ammo_count", ammo)
	print("gun init")
	bullet_prefab = preload("res://gamescenes/Bullet.tscn")
	root = get_node("/root")
	shootSounder = get_node("./ShootSounder")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gun_process(_delta):
	if Input.is_action_just_pressed("player_shoot"):
		_shoot()


