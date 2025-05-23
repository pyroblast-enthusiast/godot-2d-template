class_name Player
extends CharacterBody2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var state_machine: StateMachine = $StateMachine

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	state_machine.initialize(self)
		
	
func _process(delta: float) -> void:
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
		
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func set_direction() -> bool: 
	var new_dir: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_dir == cardinal_direction:
		return false
		
	cardinal_direction = new_dir
	sprite_2d.scale.x = -1 if cardinal_direction ==Vector2.LEFT else 1
	return true
	
	
	
func update_animation(state: String) -> void:
	animation_player.play(state + "_" + animation_direction())
	
	
func animation_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
		
		
#func _input(event: InputEvent) -> void:
	#if (event.is_action_pressed("up")):
		#velocity = Vector2.UP * move_speed
	#if (event.is_action_pressed("left")):
		#velocity = Vector2.LEFT * move_speed
	#if (event.is_action_pressed("down")):
		#velocity = Vector2.DOWN * move_speed
	#if (event.is_action_pressed("right")):
		#velocity = Vector2.RIGHT * move_speed
