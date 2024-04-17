extends TextureProgress


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_time = 1000
var max_time = 100

func _update_value(newvalue):
	value = newvalue 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_time <= max_time:
		current_time += delta
		value = floor(current_time/max_time * max_value)


func _on_Gun_reloading(rtime: float):
	current_time = 0
	max_time = rtime
	modulate = Color(1, 1, 1, 0.4)


func _finish_reloading():
	modulate = Color(1, 1, 1, 1)
