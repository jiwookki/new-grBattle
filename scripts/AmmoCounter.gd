extends Label




export var prefix : String

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func on_update_value(new_value):
	if new_value == 0:
		text = prefix + "Reload"
	else:
		text = prefix + str(new_value)
	
