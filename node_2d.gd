extends Node2D

var peer = ENetMultiplayerPeer.new()

@export var player_scene:PackedScene






func _on_host_pressed() -> void:
	peer.create_server(1576)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()
	#$Host.visible = false
	#$Join.visible = false
func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child",player)
	


func _on_join_pressed() -> void:
	peer.create_client("25.54.158.67",1576)
	multiplayer.multiplayer_peer = peer
	#$Host.visible = false
	#$Join.visible = false
