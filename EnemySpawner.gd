extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Single enemy spawner. Will spawn only one enemy on screen at any given time.

export var score : int

export var spawn_rate : int

export var spawn_x_min : int
export var spawn_x_max : int
export(PackedScene) var enemy_scene

var rng = RandomNumberGenerator.new()
var _currentSpawn = 0
var _nextSpawn : int
var _spawning = true
var _new_enemy
var _root
var _game_scorer

func _on_enemy_death():
	_spawning = true
	_currentSpawn = 0
	_game_scorer.change_score(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	_nextSpawn = rng.randi_range(0, spawn_rate)
	_root = get_node("/root")
	_game_scorer = get_node("/root/Game")

func _spawn():
	_new_enemy = enemy_scene.instance()
	_new_enemy.global_position = Vector2(rng.randi_range(spawn_x_min, spawn_x_max), position.y)
	_new_enemy.connect("tree_exiting", self, "_on_enemy_death")
	_root.add_child(_new_enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _spawning:
		_currentSpawn += 1
	if _currentSpawn >= _nextSpawn:
		_nextSpawn = rng.randi_range(0, spawn_rate)
		_currentSpawn = -1
		_spawning = false
		_spawn()
