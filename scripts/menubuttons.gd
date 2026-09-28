extends Button

func _ready():
	# main menu
	var menuPlayButton = %playButton
	var creditsButton = %creditsbutton
	var coinDisplayLabel = %CoinUILabel
	var levelButton = %levelButton
	menuPlayButton.pressed.connect(menuPlay_button_pressed)
	creditsButton.pressed.connect(credit_button_pressed)
	levelButton.pressed.connect(level_button_pressed)
	
	# Coin updator:
	coinDisplayLabel.text = str(Global.coinBalance)

# game over screen buttons
func menuPlay_button_pressed():
	Global.checkpointNumber = 0
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func credit_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	
func level_button_pressed():
	get_tree().change_scene_to_file("res://scenes/levelselector.tscn")
	
