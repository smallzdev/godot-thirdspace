extends Area2D

# This variable is going to track the checkpoint number
var checkpointNumber = 0

# Asigns it for animation
@onready var CheckpointSprite = %Sprite2D

# Checks if the character touched the checkpoint flag
# Increases the variable, and switches the animation frame of my flag to 1 (which is green :D)
# I made it also print checkpoint for debugging.
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		if CheckpointSprite.frame == 0:
			checkpointNumber += 1
			print("checkpoint activated:", checkpointNumber)
		CheckpointSprite.frame = 1
	
