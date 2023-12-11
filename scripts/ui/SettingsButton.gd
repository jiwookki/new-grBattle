extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var settingsScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reset_focus():
	grab_focus()


func _on_SettingsButton_pressed():
	var new_settings = settingsScene.instance()
	new_settings.set_handover(self, "reset_focus")
	get_node("../").add_child(new_settings)