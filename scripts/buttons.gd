extends Button

var mainMenuScene = preload("res://main_menu.tscn")

func _ready():
	# Game Over Screen Buttons
	var resumeButton = %resume
	var mainMenuButton = %mainmenubutton
	resumeButton.pressed.connect(_resume_button_pressed)
	mainMenuButton.pressed.connect(_mainMenu_button_pressed)


# game over screen buttons
func _resume_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _mainMenu_button_pressed():
	get_tree().change_scene_to_packed(mainMenuScene)
