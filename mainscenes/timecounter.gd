extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timer_ref: NodePath

var elapsed = 0

func convert_to_display():
	var seconds = elapsed % 60
	var minutes = (elapsed / 60) % 60
	var hours = (elapsed / 60) / 60
	
	text = "%02d:%02d:%02d" % [hours, minutes, seconds]

func increment():
	
	elapsed += 1
	convert_to_display()

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_node(timer_ref)
	timer.connect("timeout", self, "increment")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
