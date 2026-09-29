extends Node2D
# smallz here, just basically copy pasted the coin script that
# Victoria made, and just edited it to make it (hopefully) work 
# for hearts / lives.

@onready var heartLabel = $"../CanvasLayer2/HeartUI/LivesLabel"

# when characterbody2d / player
# enters the heart 2D area
# checks to see if player is touching the heart
# if yes -> calls global.gd 
#global.gd: +1 lives, 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: 
		Global.lives += 1
		heartLabel.text = str(Global.lives)
		print("Life collected, you currenty have ", Global.lives, " lives.")
		self.queue_free()
