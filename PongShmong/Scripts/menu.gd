extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_solo_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
	Global.set_ai_play(false)
	


func _on_exit_pressed():
	get_tree().quit()



func _on_play_against_pc_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
	Global.set_ai_play(true)
	
