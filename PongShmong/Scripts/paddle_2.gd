extends StaticBody2D

const SPEED = 400.0
const PADDLE_HEIGHT = 124
const WINDOW_HEIGHT = 544

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("up_w", "down_s")
	if direction > 0:
		position.y += SPEED * delta
	if direction < 0:
		position.y -= SPEED * delta
	else: 
		pass
	
	# limit paddle movement to the borders of the window
	position.y = clamp(position.y, -WINDOW_HEIGHT / 2 + PADDLE_HEIGHT / 2, WINDOW_HEIGHT / 2 - PADDLE_HEIGHT / 2)
