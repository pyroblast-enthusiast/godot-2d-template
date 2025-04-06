class_name Player
extends CharacterBody2D


@export var move_speed: float = 0


func _ready() -> void:
	pass
	
	
func _process(delta: float) -> void:
	pass
	
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("up")):
		velocity = Vector2.UP * move_speed
	if (event.is_action_pressed("left")):
		velocity = Vector2.LEFT * move_speed
	if (event.is_action_pressed("down")):
		velocity = Vector2.DOWN * move_speed
	if (event.is_action_pressed("right")):
		velocity = Vector2.RIGHT * move_speed
