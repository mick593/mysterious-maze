extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func new_game():
	$HUD.hide_idle_UI()
	score = 0;
	$HUD.update_score(score)
	$Character.start($SpawnPosition.position)
	$Character.isAllowMovement = true
	

func _on_Goal_area_entered(area):
	
	print("You win")
	game_over()

func game_over():
	$Character.isAllowMovement = false
	$HUD.show_gamer_over_message(str(score))
	$HUD.show_idle_UI()
	

func _on_Character_update_score_onMove():
	score += 1;
	$HUD.update_score(score)


func _on_HUD_start_game():
	new_game()
	
