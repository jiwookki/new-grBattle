

extends Gun

signal update_ammo_count


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var shootSounder

func _force_shoot():
	shootSounder.play()
	shoot_direction = (get_global_mouse_position() - global_position).normalized()
	._force_shoot()

func _on_start_reload():
	emit_signal("update_ammo_count", "Reload")

func _on_finish_reload():
	emit_signal("update_ammo_count", ammo)

func _on_ammo_change(newammo):
	emit_signal("update_ammo_count", newammo)


# Called when the node enters the scene tree for the first time.
func _ready():
	
	emit_signal("update_ammo_count", ammo)
	print("gun init")
	root = get_node("/root")
	shootSounder = get_node("./ShootSounder")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _gun_process(delta):
	if Input.is_action_pressed("player_shoot"):
		_shoot()

