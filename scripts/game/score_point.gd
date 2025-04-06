extends Node

@export var amount: int = 100
@export var pop_label_scene: PackedScene = preload("res://scenes/ui/pop_label.tscn")

func increase_score(score: int = amount, pop_score: PackedScene = pop_label_scene) -> void:
	Score.current += score


func foo():
	var body
	body.add_user_signal()
