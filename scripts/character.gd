extends CharacterBody2D
class_name CharacterBody

@export var amount: int = 1

# edit these to alter speed and gravity.
const normalSPEED = 300.0
const JUMP_VELOCITY = -950.0
var jump_count = 0

# ladder climbspeed
const climbspeed = 200.0
# onLadder variable is referenced in scripts/ladder.gd
var onLadder = false

# the higher dashspeed is - the lower u want
# dash length to be - balancing
const dashspeed = 1500
#time dash will last
const dashlength = .15

@onready var dash = $Dash

# preloads the gameover screen to avoid lag.
var gameoverscene = preload("res://scenes/menus/game_over.tscn")
var completelevel = preload("res://scenes/menus/levelcomplete.tscn")

@onready var mainSprite = %MainCharacter
@onready var livesLabel = %LivesLabel

# Fetches the current startposition :D
func _ready() -> void:
	var startposition = global_position
	Global.lives = 3
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if onLadder == false and not is_on_floor():
		velocity += get_gravity() * delta
	else: 
		jump_count = 0
		
	if onLadder == true and Input.is_action_pressed("Jump"):
		global_position.y -= climbspeed * delta
	
	if Input.is_action_just_pressed("dash"):
		dash.startdash(dashlength)
	var SPEED = dashspeed if dash.isdashing() else normalSPEED

	# Handle jump. + Double jump!!
	if Input.is_action_just_pressed("Jump") and jump_count < Global.max_jump and onLadder == false:
		jump_count += 1
		velocity.y = JUMP_VELOCITY
		mainSprite.animation = "jumping"
		
	# crawling and crouching.
	if Input.is_action_just_pressed("crawl"):
		if rotation == 0:
			rotation = deg_to_rad(92)
		else:
			rotation = 0
		
	var direction := Input.get_axis("Left", "Right")
	# uses input map ^
	
	# animations for running and idle.
	if direction:
		velocity.x = direction * SPEED
		mainSprite.animation = "running"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		mainSprite.animation = "default"
		
	# lives and checkpoint script
	if not is_on_floor() and global_position.y > 1500:
		Global.remove_all_coins(amount)
		var spawnposition: Vector2
		
# once they die with 1 life remaining, it shows the gameover
# scene.
		if Global.lives < 2:
			print("All lives used, game over D:")
			Global.checkpointNumber = 0
			get_tree().change_scene_to_packed(gameoverscene)
		
# decreases the lives once it goes bellow a certain level.
		Global.lives -= 1
		livesLabel.text = str(Global.lives)
		print("lives: ", Global.lives)
		
# If checkpointNumber == 0, it means there are no active
# checkpoints. This makes it spawn at the start of the level.
		if Global.checkpointNumber == 0:
			global_position = spawnposition
			
		elif Global.checkpointNumber == 1:
			global_position = $"../Checkpoint1".global_position
			print("yay the checkpoint spawning script works!")
			
		elif Global.checkpointNumber == 2:
			global_position = $"../Checkpoint2".global_position
			
		elif Global.checkpointNumber == 3:
			global_position = $"../Checkpoint3".global_position
		
		elif Global.checkpointNumber == 4:
			global_position = $"../Checkpoint4".global_position
		
		elif Global.checkpointNumber == 5:
			global_position = $"../Checkpoint5".global_position
		
		elif Global.checkpointNumber == 6:
			global_position = $"../Checkpoint6".global_position
			
# ^^ if you or I add morre checkpoints, remember to update this
	
	# something to do with the character moving
	move_and_slide()
	
	# Animation for left and right
	var isLeft = velocity.x < 0
	mainSprite.flip_h = isLeft
