extends RigidBody2D

const START_SPEED := 600

var speed_increment := 50
var current_speed := START_SPEED
var reset_position := false
var direction_to_player := 0 # 1 is for right - player 1, -1 is for left - player 2, 0 is random
@onready var timer_label := $"../Label"


signal score_for_player_1
signal score_for_player_2

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print_time_left()


func _on_body_entered(body):
	if body.name == "PaddleBody1" or body.name == "PaddleBody2":
		current_speed += speed_increment
		linear_velocity = linear_velocity.normalized() * current_speed
	if body.name == "Right":
		score_for_player_2.emit()
		direction_to_player = 1
		reset_position = true
	if body.name == "Left":
		score_for_player_1.emit()
		direction_to_player = -1
		reset_position = true
		
func ball_reset():
	linear_velocity = Vector2.ZERO
	position = Vector2.ZERO
	
# dir = 1 -> the ball will go right aka player 1
# dir = -1 -> the ball will go left aka player 2
# dir = 0 -> the ball will go randomly right or left aka random player
func start_movement():
	randomize()

	# reset direction_to_player at start
	if direction_to_player == 0:
		direction_to_player = randi_range(0, 1)
		if direction_to_player == 0:
			direction_to_player = -1

	var direction = Vector2(direction_to_player, randf_range(-0.5, 0.5)).normalized()

	if direction == Vector2.ZERO:
		direction = Vector2(1, 0).normalized()
	linear_velocity = direction * START_SPEED
	

func _integrate_forces(state):
	if reset_position:
		reset_ball_and_apply_direction(state)
	
func reset_ball_and_apply_direction(state):
	current_speed = START_SPEED
	state.transform.origin = Vector2.ZERO
	state.linear_velocity = Vector2.ZERO
	state.angular_velocity = 0
	reset_position = false
	$Timer.start(3)


func _on_timer_timeout():
	start_movement()
	
func print_time_left():
	if $Timer.get_time_left() < 2.95 and $Timer.get_time_left() > 0:
		timer_label.show()
	if $Timer.get_time_left() > 2:
		timer_label.text = "3"
	elif $Timer.get_time_left() > 1:
		timer_label.text = "2"
	elif $Timer.get_time_left() > 0:
		timer_label.text = "1"
	else:
		timer_label.text = "0"
		timer_label.hide()
