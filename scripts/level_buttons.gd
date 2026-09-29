extends Node
# Script for every single button for the levels. This is gonna be time consuming.....
# UGHGHGHGHGHGHGH
@onready var conPanel = $"../CanvasLayer/constructionPanel"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level1Button = $"1"
	var level2Button = $"2"
	var level3Button = $"3"
	var otherLevelButtons = [$"4", $"5", $"6", $"7", $"8", $"9", $"10", $"11", $"12", $"13", $"14", $"15"]
	var ConTinue = $"../CanvasLayer/constructionPanel/conContinueButton"
	# ^ Con (as in construction) tinue (as in continue) :D
	level1Button.pressed.connect(level1Pressed)
	level2Button.pressed.connect(level2Pressed)
	level3Button.pressed.connect(level3Pressed)
	ConTinue.pressed.connect(ConTinuePressed)
	
	for button in otherLevelButtons:
		button.pressed.connect(otherButtonPressed)
	

# Currently it doesn't check if you've unlocked it, ill do that
# later, for now itll be better for debugging that stupid scene
# 2 finish.

# Bunch of functions for detecting the button presses
func level1Pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Global.level = 1
	
func level2Pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	Global.level = 2

func level3Pressed():
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
	Global.level = 3

func ConTinuePressed():
	conPanel.visible = false
	
func otherButtonPressed():
	conPanel.visible = true
