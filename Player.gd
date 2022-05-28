extends KinematicBody2D


export var speed = 200
var screen_size
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_input(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
	if Input.is_action_pressed("move_left"):
		velocity.x = -1
	if Input.is_action_pressed("move_up"):
		velocity.y = -1
	if Input.is_action_pressed("move_down"):
		velocity.y = 1
	velocity = velocity.normalized() * speed
	
func _process(delta):
	get_input(delta)
	var v_x = Vector2(velocity.x,0)
	var v_y = Vector2(0, velocity.y)
	move_and_collide(v_x * delta)
	move_and_collide(v_y * delta)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
