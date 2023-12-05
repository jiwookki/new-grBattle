extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var config = ConfigFile.new()

var use_mouse_inputs : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	load_configs()



func load_configs():
	var err = config.load("user://scores.cfg")
	use_mouse_inputs = config.get_value("game_settings", "use_mouse_inputs", false)
		
func save_configs():
	config.set_value("game_settings", "use_mouse_inputs", use_mouse_inputs)
	config.save("user://settings.cfg")
