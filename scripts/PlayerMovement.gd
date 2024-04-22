extends "res://GameMovObj.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var max_speed = 200.0

export var lerp_rate = 5.0

export var fuel_drain_multiplier = 0.1

export var dash_speed = 500.0

export var dash_lerp = 12.0

export var fuel_capacity = 0.2

export var dash_regen_muliplier = 0.4

export var dash_recharge_cooldown = 3

var _velocity = Vector2(0, 0)

var _accel = Vector2(0, 0)

onready var _max_velocity = Vector2(max_speed, max_speed)

var _dash = 0

var _minimum_dash = 0.1

var _dash_recharging = false

onready var fuel = fuel_capacity
onready var dash_audio = get_node("./DashPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_boundary()

func _check_fuel_level():
	if fuel <= 0:
		_dash_recharging = true

func _fuel_regen(delta):
	fuel = lerp(fuel, fuel_capacity * 1.025, delta * dash_regen_muliplier)
	if fuel >= fuel_capacity:
		_dash_recharging = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_accel = Input.get_vector("movement_left", "movement_right", "movement_up", "movement_down")
	
	_dash = Input.get_axis("dash_left", "dash_right")
	
	position += _velocity * delta
	
	if fuel > 0 and _dash_recharging == false:
	
		if _dash != 0:
		
			_velocity = Vector2(_dash * dash_speed, _velocity.y)
			fuel -= delta
			dash_audio.play()
			_check_fuel_level()
	
		elif _accel != Vector2.ZERO:
		
			_velocity = _velocity.linear_interpolate(_accel * max_speed, delta*lerp_rate)
			fuel -= delta * fuel_drain_multiplier * _accel.length_squared()
			_check_fuel_level()
			
		else:
			_fuel_regen(delta)
		

	else:
		_fuel_regen(delta)
		
		
	

	#if dash_fuel >= _minimum_dash:
	#	_dash = Input.get_axis("dash_left", "dash_right")
		
#	if fuel <= 0:
#		_dash = 0
#		_dash_recharging = true
#	elif _dash_recharging == false:
#		_dash = Input.get_axis("dash_left", "dash_right")
#
#	if _dash_recharging:
#		fuel = clamp(fuel + delta * dash_regen_muliplier, 0, fuel_capacity)
#		if fuel >= fuel_capacity:
#			_dash_recharging = false
#
#	if _dash == 0:
#		_velocity = _velocity.linear_interpolate(_accel * max_speed, delta*lerp_rate)
#		fuel = clamp(fuel + delta * dash_regen_muliplier, 0, fuel_capacity)
#	else:
#		_velocity = Vector2(_dash * dash_speed, _velocity.y)
#		fuel -= delta
#		dash_audio.play()
	
	
		
	
	_keep_boundary()
	
func _init_boundary():
	var _objSprite = _get_self_sprite()
	minX = border_offset + 40
	maxX = border_x + border_offset - 40 
	minY = 40
	maxY = -40 + get_viewport_rect().size.y
	print(str(minX))
	print(str(maxX))
	print(str(minY))
	print(str(maxY))

