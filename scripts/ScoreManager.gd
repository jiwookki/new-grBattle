extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0

# Called when the node enters the scene tree for the first time.
onready var config = ConfigFile.new()
var high_score: int

var high_score_date = "date not loaded"
# Called when the node enters the scene tree for the first time.
func _ready():
	# Load data from a file.
	load_high_score()

func load_high_score():
	print("high_score_loaded")
	var err = config.load("user://scores.cfg")
	

# If the file didn't load, ignore it.
	if err != OK:
		return
		high_score = 0
		high_score_date = "No date saved"
	else:
		high_score = config.get_value("score", "high_score")
		high_score_date = config.get_value("score", "high_score_date")
	print("high score is")
	print(high_score)
	
	if high_score_date == null:
		high_score_date = "No date saved"
	
func save_high_score(score):
	print("saving score...")
	
	if high_score < score:
		config.set_value("score", "high_score", score)
		config.set_value("score", "high_score_date", Time.get_datetime_string_from_system(false, true))
		high_score_date = Time.get_datetime_string_from_system(false, true)
		config.save("user://scores.cfg")
		return true
	else:
		return false

func get_score():
	return score

func get_high_score():
	return high_score
	
func get_high_score_date():
	return high_score_date
	
func is_new_high():
	print(high_score)
	print(score)
	if high_score < score:
		print("new high!")
		return true
	else:
		print("not new high")
		return false

func change_score(score_delta):
	score += score_delta
	
func reset_score():
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
