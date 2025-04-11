class_name StateAttack
extends State

@export var idle_state: StateWalk
@export var walk_state: StateWalk
@export var animation_player: AnimationPlayer

var attacking: bool = false


func enter() -> void:
	player.update_animation("attack")
	animation_player.animation_finished.connect(end_attack)
	attacking = true
	
	
func process(_delta : float) -> State:
	player.velocity = Vector2.ZERO
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle_state
		else:
			return walk_state
			
	return null


func physics_process(_delta : float) -> State:
	return null
	

func unhandled_input(event: InputEvent) -> State:
	return null
	

#func next_transition() -> void:
	#printerr("method not implemented")


func exit() -> void:
	printerr("method not implemented")
	

func end_attack(new_animation: String) -> void:
	attacking = false	
