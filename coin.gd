extends Node2D

@export var amount = 1

# when characterbody2d / player
# enters coin 2D area
# checks to see if player is touching coin
#if yes -> calls global.gd 
#global.gd: +1 coin, 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: 
		Global.add_coins(amount)
		self.queue_free()
