extends Area2D

@onready var shopmusic = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("../shopkeeper/Shop/Panel").hide()
	shopmusic.stop()

func _on_body_entered(body: Node2D) -> void:
	print("Shop entered: ", body.name)
	if body.name == "CharacterBody2D":
		shopmusic.play()
		get_tree().paused = true
		get_node("../CharacterBody2D/MainCharacter").play("default")
		get_node("../shopkeeper/Shop/Panel").show()

func _on_body_exited(body: Node2D) -> void:
	shopmusic.stop()
