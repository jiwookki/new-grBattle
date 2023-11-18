extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed : float
export var max_offset : float

export var dash_speed : int
export var dash_duration : float

export var dash_chance : float

var _dash_cycle = 0
var _dash_direction = 0
var _dash_rng = RandomNumberGenerator.new()

var player : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Game/Delta1")
	print(player)
	player.get_node("./Gun").connect("on_shot", self, "on_player_shot")
	_init_boundary()

func on_player_shot():
	if _dash_rng.randf() < dash_chance:
		if player.position.x > position.x:
			_dash_direction = -dash_speed
		else:
			_dash_direction = dash_speed
		_dash_cycle = dash_duration



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _dash_cycle <= delta:
		if player.position.x > position.x + max_offset:
			position.x += speed * delta
		elif player.position.x < position.x - max_offset:
			position.x -= speed * delta
	else:
		position.x += _dash_direction * delta
		_dash_cycle -= delta
	_keep_boundary()
			


func _on_death():
	emit_signal("tree_exiting", true)
