extends Button

func _ready():
	# main menu
	var menuPlayButton = %playButton
	var creditsButton = %creditsbutton
	var coinDisplayLabel = %CoinUILabel
	var levelButton = %levelButton
	var endlessButton = %endlessButton
	menuPlayButton.pressed.connect(menuPlay_button_pressed)
	creditsButton.pressed.connect(credit_button_pressed)
	levelButton.pressed.connect(level_button_pressed)
	endlessButton.pressed.connect(endlessbutton_pressed)
	
	# Coin updator:
	coinDisplayLabel.text = str(Global.coinBalance)

# game over screen buttons
func menuPlay_button_pressed():
	Global.checkpointNumber = 0
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
	
func credit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits.tscn")
	
func level_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/levelselector.tscn")
	
func endlessbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/endless_mode.tscn")
	
