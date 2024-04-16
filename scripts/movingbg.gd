extends ParallaxBackground

export var target_speed : float

var scroll_speed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var accel = 0.5


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.y += scroll_speed * delta
	scroll_speed = lerp(scroll_speed, target_speed, delta * accel)
	

func _fadeout():
	target_speed = 0
	
func _slowdown(health):
	scroll_speed = 500
	
