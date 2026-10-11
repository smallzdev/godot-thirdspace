extends Area2D

# I plan on fixing this later and making everything into one variable,
# and preloading the next scene to avoid lag, but this will do 4
# now. 

#var nextScene = preload("res://scenes/levels/level2.tscn")
#var scene3 = preload("res://scenes/levels/level3.tscn")
#var scene4 = preload("res://scenes/levels/level4.tscn")
#var scene5 = preload("res://scenes/levels/level5.tscn")

func _on_body_entered(body: Node2D) -> void:
	print("trohy script ", body.name)
	if (body.name == "CharacterBody2D"):
		print("player detected")
		# does a bunch of things and resets / edits variables
		Global.checkpointNumber = 0
		Global.lives = 3
		Global.coinBalance += Global.coins
		Global.coins = 0
		
		if Global.level >= 1 and Global.level <= 4:
			Global.level += 1
			print("level after: ", Global.level)
			# ^^^^ increases level for next scene
			get_tree().change_scene_to_file("res://scenes/menus/levelcomplete.tscn")
			# get_tree().change_scene_to_file("res://scenes/levels/level" + str(Global.level) + ".tscn")
		else:
			print("Error, next level doesn't expist. Redirecting to main menu...")
			get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
