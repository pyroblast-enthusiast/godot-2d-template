class_name StateWalk
extends State

@export var idle_state: StateIdle
@export var attack_state: StateAttack

@export var animation_name: String = ''
@export var movement_speed: float = 100.0


func enter() -> void:
	player.update_animation(animation_name)
	
	
func process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle_state
	
	player.velocity = player.direction * movement_speed
	
	if player.set_direction():
		player.update_animation(animation_name)
	return null


func physics_process(_delta : float) -> State:
	return null
	

func unhandled_input(event: InputEvent) -> State:
	return null
	

#func next_transition() -> void:
	#printerr("method not implemented")


func exit() -> void:
	printerr("method not implemented")
