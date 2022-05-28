extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	show_idle_UI()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func update_score(score):
	$ScoreLabel.text = str(score)

func hide_idle_UI():
	$Message.hide()
	$StartButton.hide()

func show_idle_UI():
	$Message.show()
	$StartButton.show()

func show_gamer_over_message(message):
	$Message.text = "Your score is " + message 

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
