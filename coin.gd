extends Node2D

@export var amount = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: 
		Global.add_coins(amount)
		self.queue_free()
