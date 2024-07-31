extends Node2D

@onready var ball = $Ball.get_child(0)
var player_1_score := 0
var player_2_score := 0
const MAX_SCORE := 11
const WON_COLOR := Color(1, 0.84, 0)
var gameover := false

# Called when the node enters the scene tree for the first time.
func _ready():
	ball.score_for_player_1.connect(_adding_score_to_player_1)
	ball.score_for_player_2.connect(_adding_score_to_player_2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameover == false:
		if player_1_score == MAX_SCORE:
			game_over_screen("1")
		if player_2_score == MAX_SCORE:
			game_over_screen("2")
	

func _adding_score_to_player_1():
	update_score($Score.get_child(0))
	player_1_score += 1



func _adding_score_to_player_2():
	update_score($Score.get_child(1))
	player_2_score += 1



func update_score(textLabel):
	textLabel.text = str(int(textLabel.text) + 1)


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
func game_over_screen(player_num_in_str):
	gameover = true
	if Global.get_ai_play() == true and player_2_score >= 11:
		$Label.text = "AI Won!"
	else:
		$Label.text = "Player " + player_num_in_str + " Won!"
	$Label.add_theme_color_override("font_color", WON_COLOR)
	remove_ball()


func remove_ball():
	var ball_node = get_node("Ball")
	if ball_node:
		ball_node.queue_free()
