extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	var player_id = multiplayer.get_unique_id()
	print(player_id)

func _ready() -> void:
	multiplayer.peer_disconnected.connect(on_peer_disconnected)

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())


func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down")*SPEED
		move_and_slide()

func on_peer_disconnected(peer_id: int) -> void:
	if peer_id == get_multiplayer_authority():
		queue_free()
