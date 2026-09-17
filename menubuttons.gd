extends Button

func _ready():
	# main menu
	var menuPlayButton = %playButton
	var creditsButton = %creditsbutton
	menuPlayButton.pressed.connect(_menuPlay_button_pressed)
	creditsButton.pressed.connect(_credit_button_pressed)


# game over screen buttons
func _menuPlay_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	
func _credit_button_pressed():
	print("Credits are under construction")
