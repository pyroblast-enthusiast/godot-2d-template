class_name Player
extends CharacterBody2D


@export var move_speed: float = 0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var state: String = "idle"


func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.x = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity = direction * move_speed * delta
	
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func set_direction() -> bool: 
	return true
	
	
func set_state() -> bool:
	return true
	
	
func update_animation() -> void:
	pass
	
	
#func _input(event: InputEvent) -> void:
	#if (event.is_action_pressed("up")):
		#velocity = Vector2.UP * move_speed
	#if (event.is_action_pressed("left")):
		#velocity = Vector2.LEFT * move_speed
	#if (event.is_action_pressed("down")):
		#velocity = Vector2.DOWN * move_speed
	#if (event.is_action_pressed("right")):
		#velocity = Vector2.RIGHT * move_speed
