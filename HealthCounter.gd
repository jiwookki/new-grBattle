extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var base_text = "Health: "

# Called when the node enters the scene tree for the first time.
func _ready():
	text = base_text # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_update_health(newhealth):
	print(newhealth)
	text = base_text + str(newhealth)
