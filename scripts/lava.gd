extends Area2D

# Currently only works for level 4 i think.

@onready var character2D = %CharacterBody2D

# lava #1
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		# teleports the character really low, which makes them
		# lose a life due to the live mechanism in characterBody2D
		character2D.global_position.y = 1501
		
# lava 3
func _on_lava33_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		character2D.global_position.y = 1501

# lava 2
func _on_lava2_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		character2D.global_position.y = 1501
