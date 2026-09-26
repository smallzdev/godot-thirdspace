extends CharacterBody2D
class_name CharacterBody

@export var amount = 1

# edit these to alter speed and gravity.
const SPEED = 300.0
const JUMP_VELOCITY = -950.0

# preloads the gameover screen to avoid lag.
var gameoverscene = preload("res://scenes/game_over.tscn")

@onready var mainSprite = %MainCharacter
@onready var livesLabel = $"../CanvasLayer2/HeartUI/LivesLabel"

# Fetches the current startposition :D
func _ready() -> void:
	var startposition = global_position
	Global.lives = 3
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		mainSprite.animation = "jumping"

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
	if not is_on_floor() and global_position.y > 1000:
		Global.remove_all_coins(amount)
		var spawnposition: Vector2
		
# once they die with 1 life remaining, it shows the gameover
# scene.
		if Global.lives < 2:
			print("All lives used, game over D:")
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
	
	# something to do with the character moving
	move_and_slide()
	
	# Animation for left and right
	var isLeft = velocity.x < 0
	mainSprite.flip_h = isLeft
	
