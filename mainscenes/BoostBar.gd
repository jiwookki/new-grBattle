extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("/root/Game/Delta1")

onready var max_dash = player.fuel_capacity

# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = max_dash
	min_value = 0
	value = max_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = player.fuel
	if player._dash_recharging:
		modulate = Color(1, 1, 1, 0.4)
	else:
		modulate = Color(1, 1, 1, 1)
	
