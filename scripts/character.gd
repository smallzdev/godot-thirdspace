extends CharacterBody2D
class_name CharacterBody

@export var amount = 1

const SPEED = 300.0
const JUMP_VELOCITY = -950.0
var lives = 3
var gameoverscene = preload("res://scenes/game_over.tscn")

@onready var mainSprite = %MainCharacter
@onready var livesLabel = $"../CanvasLayer2/HeartUI/LivesLabel"

# Fetches the current startposition :D
func _ready() -> void:
	var startposition = global_position
	
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
	if direction:
		velocity.x = direction * SPEED
		mainSprite.animation = "running"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		mainSprite.animation = "default"
	if not is_on_floor() and global_position.y > 1000:
		Global.remove_all_coins(amount)
		var spawnposition: Vector2
		if lives == 1:
			print("All lives used, game over D:")
			get_tree().change_scene_to_packed(gameoverscene)
		lives -= 1
		livesLabel.text = str(lives)
		print("lives: ", lives)
		global_position = spawnposition
		
	move_and_slide()
	
	var isLeft = velocity.x < 0
	mainSprite.flip_h = isLeft
	
