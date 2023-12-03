extends HealthTracker


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal init_healthbar

var damagesounder : AudioStreamPlayer

func take_damage(dmg):
	damagesounder.play()
	.take_damage(dmg)
	emit_signal("on_health_change", health)

# Called when the node enters the scene tree for the first time.
func _ready():
	damagesounder = get_node("./PlayerDamageSounder")
	emit_signal("init_healthbar", starting_health)

func die():
	get_node("/root/Game").on_game_over()
	queue_free()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Delta1_area_entered(area):
	if area.is_in_group("player_damager"):
		take_damage(area.damage)
