extends Area2D

@onready var character2D = $"../../CharacterBody2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# lava #1
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		# teleports the character really low, which makes them
		# lose a life due to the live mechanism in characterBody2D
		character2D.global_position.y = 5000
		
# lava #2. I dont know why the name's like this but i cant seem to
# be able to change it to anything else :/
func _on_lava_3_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		character2D.global_position.y = 5000

# lava 3
func _on_lava33_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		character2D.global_position.y = 5000
