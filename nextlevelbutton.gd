extends Button

func _ready():
	var creditMenuButton = %nextlevelbutton
	creditMenuButton.pressed.connect(_creditMenu_button_pressed)
		
func _creditMenu_button_pressed():
	pass
	#next level
	#finishing in next update after consulting smallz
