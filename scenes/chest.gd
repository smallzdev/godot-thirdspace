extends AnimatedSprite2D
# This script is for the chest to interact and open when
# holding E, also handles animation :D
var holdSec = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# chest interaction
func interaction(delta, event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		holdSec += delta
	if event.is_action_released("Interact"):
		holdSec = 0
	if holdSec > 3:
		holdSec = 0
		print("Holded for 3 secconds")
