

extends Gun

signal update_ammo_count


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player : RigidBody2D

var shootSounder

var physicsdeltaTime

func _launch_bullet(newbullet):
	newbullet.startShoot(shoot_speed * shoot_direction + player.linear_velocity, global_position, player.rotation)

func _force_shoot():
	shootSounder.play()
	shoot_direction = Vector2.UP.rotated(player.rotation)
	._force_shoot()

func _on_start_reload():
	emit_signal("update_ammo_count", "Reload")

func _on_finish_reload():
	emit_signal("update_ammo_count", ammo)

func _on_ammo_change(newammo):
	emit_signal("update_ammo_count", newammo)


# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	emit_signal("update_ammo_count", ammo)
	print("gun init")
	shootSounder = get_node("./ShootSounder")
	player = get_node("../")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gun_process(delta):
	if Input.is_action_pressed("player_shoot"):
		_shoot()
		
func _physics_process(delta):
	physicsdeltaTime = delta

