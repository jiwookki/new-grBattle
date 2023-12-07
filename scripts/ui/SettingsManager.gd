extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var config = ConfigFile.new()

var use_mouse_inputs : bool

var video_mode : int

var settings_file = "user://settings.cfg"

var video_settings_file = "user://video_settings.cfg"

# Called when the node enters the scene tree for the first time.
func _ready():
	load_configs()


func apply_video_configs():
	match video_mode:
		0: # fullscreen
			OS.window_fullscreen = true
			OS.window_resizable = false
		1: # resizable window
			OS.window_fullscreen = false
			OS.window_resizable = true
		2: # regular window
			OS.window_fullscreen = false
			OS.window_resizable = false
		


func apply_sync_video_configs():
	config.set_value("video_settings", "video_mode", video_mode)
	apply_video_configs()

func load_video_configs():
	video_mode = config.get_value("video_settings", "video_mode", 1)


func load_configs():
	var err = config.load(settings_file)
	use_mouse_inputs = config.get_value("game_settings", "use_mouse_inputs", false)
		
func save_configs():
	config.set_value("game_settings", "use_mouse_inputs", use_mouse_inputs)
	apply_sync_video_configs()
	print("saving configs")
	config.save(settings_file)
