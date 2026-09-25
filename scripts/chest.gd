## I know the following is kinda sloppy coding but ehh, as
## long as it works I suppose. ;D

extends Area2D
# This script is for the chest to interact and open when
# holding E, also handles animation :D
var holdSec = 0
var chestInteract = false
@onready var chestSprite = %chestSprite2D
@onready var chestTimerLabel = %chestTimerLabel
@onready var livesLabel = $"../CanvasLayer2/HeartUI/LivesLabel"
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	chestSprite.frame = 0
	chestTimerLabel.visible = false
	randomize()
# on collision, it sets chest interaction to true
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		chestInteract = true
		print("chest interact is ", chestInteract)

# chest interaction
func _process(delta) -> void:
	if Input.is_action_pressed("Interact"):
		holdSec += delta
		# Countdown timer, rounds so its not crazy
		if chestSprite.animation == "default":
			chestTimerLabel.text = str(round(3 - holdSec))
		
		# if the animation is default, that means the chest is unopened
		if chestSprite.animation == "default":
			chestTimerLabel.visible = true
		
		# the following if statment checks if the character is
		# is in range, the user held E for 3s, and it isn't
		# already open by checking the animation frame
		if holdSec >= 3 and chestInteract == true and chestSprite.animation == "default":
			# uses print for debugging
			print("Held E for 3 secs, chest interacted.")
			holdSec = 0
			# chestSprite.play plays the animation for the gems in chest
			chestSprite.play("opened")
			# i plan on changing the coins to a rng thing, but later
			chestTimerLabel.text = str("Click F to loot!")
			
		# Checks animation and the holdsec thing is just so it
		# doesn't start spamming the console ;-;
	if Input.is_action_pressed("loot") and chestSprite.animation == "opened":
		print("Opened chest")
		var lootRng = randi() % 100
		print("RNG rolled ", lootRng)
		# the following code checks the rng, and awards stuff
		# based on the number rolled. To change the RNG prizes,
		# simply do some maths and edit the > < values.
		
		# numbers 0 - 9 (technically 10 numbers)
		if lootRng <= 9:
			Global.add_coins(6)
			print("Awarded 6 coins from a chest.")
			
		# numbers 10 - 30
		elif lootRng <= 30 and lootRng >= 9:
			Global.lives += 1
			print("Awarded 1 life from a chest.")
			livesLabel.text = str(Global.lives)
			
		# Anything else, so at the moment 31 - 99
		else:
			Global.add_coins(3)
			print("Awarded 3 coins from a chest.")
		chestSprite.animation = "looted"
		chestTimerLabel.visible = false
		# planning something here shortly, for now just print
