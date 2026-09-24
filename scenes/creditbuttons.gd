extends Button

func _ready():
	var creditMenuButton = %mainmenubutton
	creditMenuButton.pressed.connect(_creditMenu_button_pressed)
		
func _creditMenu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
