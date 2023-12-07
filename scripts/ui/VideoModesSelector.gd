extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var video_modes = [
	"Fullscreen",
	"Resizable window",
	"Regular window"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	for item in video_modes:
		add_item(item)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
