extends Area2D

# This variable is going to track the checkpoint number

# Asigns it for animation
@onready var CheckpointSprite = %Sprite2D

# Checks if the character touched the checkpoint flag
# Increases the variable, and switches the animation frame of my flag to 1 (which is green :D)
# I made it also print checkpoint for debugging.
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		if name == "Checkpoint1" and Global.checkpointNumber == 0:
			Global.checkpointNumber = 1
			print("checkpoint activated:", Global.checkpointNumber)
			CheckpointSprite.frame = 1
		elif name == "Checkpoint2" and Global.checkpointNumber < 2:
			Global.checkpointNumber = 2
			print("checkpoint activated:", Global.checkpointNumber)
			# ^ I know I could've just wrote checkpoint 2
			# but I actually want to check if the assignment
			# worked or not.
			CheckpointSprite.frame = 1
		elif name == "Checkpoint3" and Global.checkpointNumber < 3:
			Global.checkpointNumber = 3
			print("checkpoint activated:", Global.checkpointNumber)
			CheckpointSprite.frame = 1
