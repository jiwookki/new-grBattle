extends HealthTracker


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_take_damage(dmg):
	emit_signal("on_health_change", health-dmg)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
