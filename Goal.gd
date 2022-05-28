extends Area2D

var CELL_SIZE = 32 # or whatever

func position_snapped(pos:Vector2):
	return (pos / CELL_SIZE).floor() * CELL_SIZE
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	align()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func align():
	position = position_snapped(position)
