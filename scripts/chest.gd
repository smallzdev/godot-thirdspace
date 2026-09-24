extends Area2D
# This script is for the chest to interact and open when
# holding E, also handles animation :D
var holdSec = 0
var chestInteract = false
@onready var chestSprite = %chestSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# on collision, it sets chest interaction to true
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		chestInteract = true
		print("chest interact is ", chestInteract)

# chest interaction
func _process(delta) -> void:
	if Input.is_action_pressed("Interact"):
		holdSec += delta
		
		if holdSec >= 3 and chestInteract == true and chestSprite.frame == 0:
			# uses print for debugging
			print("Held E for 3 secs, chest interacted.")
			holdSec = 0
			chestSprite.frame = 2
			Global.add_coins(3)
			
		elif holdSec >=3 and chestSprite.frame <= 1:
			print("already interacted with chest")
			# planning something here shortly, for now just print
