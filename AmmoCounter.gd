extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var base_text = "Ammo: "

# Called when the node enters the scene tree for the first time.
func _ready():
	text = base_text # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_update_ammo(newammo):
	print(newammo)
	text = base_text + str(newammo)
