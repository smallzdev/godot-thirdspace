extends Node2D

@onready var interactable: Area2D = $interactable
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	interactable.interact = _on_interact

func _on_interact(): 
	if sprite_2d.frame == 0:
		sprite_2d.frame = 1
		interactable.is_interactable = false
		print("harvested tree")
