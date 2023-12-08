extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var maxHealth : int



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func init_healthbar(maxhealth):
	max_value = maxhealth
	min_value = 0
	on_health_change(maxhealth)

func on_health_change(newhealth):
	value = newhealth

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
