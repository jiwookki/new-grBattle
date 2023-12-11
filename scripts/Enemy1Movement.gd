extends GameObject


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

var _new_impulse

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/Game").get_player_node()
	print(player)
	player.get_node("./Gun").connect("on_shot", self, "on_player_shot")

func on_player_shot():
	if _dash_rng.randf() < dash_chance:
		if player.position.x > position.x:
			_dash_direction = -dash_speed
		else:
			_dash_direction = dash_speed
		_dash_cycle = dash_duration


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if _dash_cycle <= delta:
		
		if player.position.x > position.x + max_offset:
			_new_impulse = Vector2(speed * delta, 0)
			
		elif player.position.x < position.x - max_offset:
			_new_impulse = Vector2(-speed * delta, 0)
			
	else:
		_new_impulse = Vector2(-speed * delta, 0)
		_dash_cycle -= delta
	
	apply_central_impulse(_new_impulse * delta * _get_relativity(linear_velocity))


func _on_death():
	if get_node("./Health").health <= 0:
		emit_signal("on_despawn", true)
