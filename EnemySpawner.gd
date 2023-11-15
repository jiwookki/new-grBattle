extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var spawnRate : int


var rng = RandomNumberGenerator.new()
var _currentSpawn = 0
var _nextSpawn : int

# Called when the node enters the scene tree for the first time.
func _ready():
	_nextSpawn = rng.randi_range(0, spawnRate)

func _spawn():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_currentSpawn += 1
	if _currentSpawn >= _nextSpawn:
		_spawn()
