extends Area2D

signal update_score_onMove

onready var ray = $RayCast2D
var tile_size = 32
var inputs = {"move_right": Vector2.RIGHT,
			"move_left": Vector2.LEFT,
			"move_up": Vector2.UP,
			"move_down": Vector2.DOWN}
export var isAllowMovement = false

func start(pos):
	position = pos
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
# Called when the node enters the scene tree for the first time.
func _ready():
	start(position)


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir) && isAllowMovement:
			move(dir)

func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size
		emit_signal("update_score_onMove")
	



