class_name StateMachine
extends Node

var states: Array[State] = []
var previous_state: State
var current_state: State


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED


func _process(delta: float) -> void:
	pass
	
	
func initialize() -> void:
	for child in get_children():
		if child is State:
			states.append(child)
	
	
func change_state(new_state: State) -> void:
	if new_state == null || new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	previous_state = current_state
	current_state = new_state
	
	current_state.enter()



#@export var initial_node_state : State
#
#var parent_node_name: String
#var node_states : Dictionary = {}
#var current_node_state : State
#var current_node_state_name : String
#
#
#func _ready() -> void:
	#parent_node_name = get_parent().name
	#
	#for child in get_children():
		#if child is State:
			#node_states[child.name.to_lower()] = child
			#child.transition.connect(transition_to)
	#
	#if initial_node_state:
		#initial_node_state.enter()
		#current_node_state = initial_node_state
		#current_node_state_name = initial_node_state.name.to_lower()
#
#
#func _process(delta : float) -> void:
	#if current_node_state:
		#current_node_state._process(delta)
#
#
#func _physics_process(delta: float) -> void:
	#if current_node_state:
		#current_node_state._physics_process(delta)
		#current_node_state.next_transition()
#
#
#func transition_to(node_state_name : String) -> void:
	#if node_state_name == current_node_state.name.to_lower():
		#return
	#
	#var new_node_state = node_states.get(node_state_name.to_lower())
	#
	#if !new_node_state:
		#return
	#
	#if current_node_state:
		#current_node_state.exit()
	#
	#new_node_state.enter()
	#
	#current_node_state = new_node_state
	#current_node_state_name = current_node_state.name.to_lower()
