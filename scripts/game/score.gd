extends Node

var current: int = 0:
	set(value):
		current = value
		if current > high:
			high = current
			
var high: int = 0

func reset() -> void:
	current = 0
