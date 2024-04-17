extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var game_over_display

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_animation_finished(_anim_name):
	get_node("/root/Control").add_child(game_over_display.instance())
