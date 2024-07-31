extends Node


var ai_play := false
var ball_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_ai_play(set_value : bool):
	ai_play = set_value
	
func get_ai_play():
	return ai_play
	
func set_ball_pos(set_value : Vector2):
	ball_pos = set_value
	
func get_ball_pos():
	return ball_pos
