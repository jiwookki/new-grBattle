extends ParallaxBackground

export var scroll_speed : float


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var accel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.y += scroll_speed * delta
	scroll_speed += accel * delta

func _fadeout():
	accel = -550
	
