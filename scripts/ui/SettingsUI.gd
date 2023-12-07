extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) onready var mouse_movement_toggle = get_node(mouse_movement_toggle) as CheckBox

export(NodePath) onready var video_settings_dropdown = get_node(video_settings_dropdown) as OptionButton

onready var settings = get_node("/root/SettingsManager")

var handover

# Called when the node enters the scene tree for the first time.

func set_handover(node_instance, new_handover):
	handover = funcref(node_instance, new_handover)

func _ready():
	mouse_movement_toggle.pressed = settings.use_mouse_inputs
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Control_tree_exiting():
	settings.use_mouse_inputs = mouse_movement_toggle.pressed
	settings.video_mode = video_settings_dropdown.selected
	print(mouse_movement_toggle.pressed)
	settings.save_configs()
	handover.call_func()
