class_name StateIdle
extends State

@export var walk_state: StateWalk

func enter() -> void:
	player.update_animation("idle")
	
	
func process(_delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk_state
	player.velocity = Vector2.ZERO
	return null


func physics_process(_delta : float) -> State:
	return null
	

func unhandled_input(event: InputEvent) -> State:
	return null
	

#func next_transition() -> void:
	#printerr("method not implemented")


func exit() -> void:
	printerr("method not implemented")
