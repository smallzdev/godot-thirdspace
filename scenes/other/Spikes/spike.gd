extends Area2D
# for both the small spike and big spike.

# currently only works for level 4

@onready var CharBodySprite = %CharacterBody2D

# Big Spike
func _on_bigspike_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		CharBodySprite.global_position.y = 1501
	
# Small spike
func _on_smallspike_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		CharBodySprite.global_position.y = 1501
		# planning to maybe make the small spike do half a heart
		# if I have time maybe?
