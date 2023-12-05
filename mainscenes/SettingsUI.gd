extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) onready var mouse_movement_toggle = get_node(mouse_movement_toggle) as CheckBox

onready var settings = get_node("/root/SettingsManager")

# Called when the node enters the scene tree for the first time.

func _on_ready():
	mouse_movement_toggle.pressed = settings.use_mouse_inputs
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Control_tree_exiting():
	settings.use_mouse_inputs = mouse_movement_toggle.pressed
	print(mouse_movement_toggle.pressed)
	settings.save_configs()
