extends Area2D

var scene2 = preload("res://level2.tscn")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_packed(scene2)
