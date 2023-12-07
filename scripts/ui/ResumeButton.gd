extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) onready var pause_root_scene = get_node(pause_root_scene) as Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_ResumeButton_pressed():
	get_node("../").visible = false
	get_tree().paused = false
