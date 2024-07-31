extends Control

var server_port := 8080
var server_ip := "127.0.0.1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_host_game_pressed():
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(server_port)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	_add_player_to_game
	multiplayer.peer_disconnected.connect(_del_player)



func _on_join_as_player_2_pressed():
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(server_ip, server_port)
	
	multiplayer.multiplayer_peer = client_peer
	
func _add_player_to_game(id : int):
	print("Player %s has joined" %id)
	
@rpc("any_peer", "call_local")
func _del_player(id : int):
	print("Player %s has disconnected" %id)

	

	
	
