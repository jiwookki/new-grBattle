extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(NodePath) var rootSettings

# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_node(rootSettings).queue_free()
