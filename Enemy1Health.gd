extends HealthTracker


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var damageSounder: AudioStreamPlayer

func take_damage(dmg):
	damageSounder.play()
	health -= dmg
	

# Called when the node enters the scene tree for the first time.
func _ready():
	._ready()
	damageSounder = get_node("./DamageSounder")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Enemy1_area_entered(area):
	if area.is_in_group("player_bullet"):
		take_damage(area.damage)
