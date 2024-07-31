extends StaticBody2D

const SPEED = 400.0
const PADDLE_HEIGHT = 124
const WINDOW_HEIGHT = 544


var pc_player := false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.get_ai_play() == true:
		play_against_pc_pressed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if pc_player == false:
		player_movement(delta)
	else:
		ai_movement(delta)
	
	# limit paddle movement to the borders of the window
	position.y = clamp(position.y, -WINDOW_HEIGHT / 2 + PADDLE_HEIGHT / 2, WINDOW_HEIGHT / 2 - PADDLE_HEIGHT / 2)
	


func play_against_pc_pressed():
	pc_player = true
	

func player_movement(delta):
	var direction = Input.get_axis("up_w", "down_s")
	if direction > 0:
		position.y += SPEED * delta
	if direction < 0:
		position.y -= SPEED * delta
		

func ai_movement(delta):
	if Global.get_ball_pos().y > position.y:
		position.y += SPEED * delta
	elif Global.get_ball_pos().y < position.y:
		position.y -= SPEED * delta
	
	
