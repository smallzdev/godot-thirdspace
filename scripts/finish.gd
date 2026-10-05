extends Area2D

# I plan on fixing this later and making everything into one variable,
# and preloading the next scene to avoid lag, but this will do 4
# now. 

var nextScene = preload("res://scenes/levels/level2.tscn")
var scene3 = preload("res://scenes/levels/level3.tscn")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		# does a bunch of things and resets / edits variables
		Global.checkpointNumber = 0
		Global.lives = 3
		Global.coinBalance += Global.coins
		Global.coins = 0
		
		Global.level += 1
		# ^^^^ increases level for next scene
		
		if Global.level == 1:
			get_tree().change_scene_to_packed(nextScene)
		elif Global.level == 2:
			get_tree().change_scene_to_packed(scene3)
		else:
			print("Error, next level doesn't expist. Redirecting to main menu...")
			get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
