extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var scrollSpeed: int

var BGS1: Sprite
var BGS2: Sprite

var scrollPhase = 0

var switchPhase: int

var maxPhase: int

var scrollOffset: int

# Called when the node enters the scene tree for the first time.
func _ready():
	BGS1 = get_node("./BG1")
	BGS2 = get_node("./BG2")
	switchPhase = BGS1.texture.get_height() * BGS1.scale.y
	maxPhase = switchPhase * 2
	scrollOffset = switchPhase / 2
	
	print("switchPhase: " + str(switchPhase))
	print("maxPhase: " + str(maxPhase))
	print("scrollOffset: " + str(scrollOffset))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scrollPhase += delta * scrollSpeed
	
	if scrollPhase >= switchPhase and scrollPhase <= maxPhase:
		
		
		BGS1.position.y = scrollPhase - switchPhase + scrollOffset
		BGS2.position.y = scrollPhase - switchPhase * 2 + scrollOffset
		
	elif scrollPhase < switchPhase:
		
		BGS1.position.y = scrollPhase - switchPhase + scrollOffset
		BGS2.position.y = scrollPhase + scrollOffset
		
	elif scrollPhase > maxPhase:
		
		scrollPhase = 0
