extends Node
# Script for every single button for the levels. This is gonna be time consuming.....
# UGHGHGHGHGHGHGH


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level1Button = $"1"
	var level2Button = $"2"
	var level3Button = $"3"
	level1Button.pressed.connect(level1Pressed)
	level2Button.pressed.connect(level2Pressed)
	level3Button.pressed.connect(level3Pressed)

# Currently it doesn't check if you've unlocked it, ill do that
# later, for now itll be better for debugging that stupid scene
# 2 finish.

# Bunch of functions for detecting the button presses
func level1Pressed ():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func level2Pressed ():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

func level3Pressed ():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
