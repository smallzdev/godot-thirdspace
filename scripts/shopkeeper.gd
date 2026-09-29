extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("Shop entered: ", body.name)
	if body.name == "CharacterBody2D":
		get_tree().paused = true
		get_node("../CharacterBody2D/MainCharacter").play("default")
		get_node("../shopkeeper/Shop/Panel").show()
