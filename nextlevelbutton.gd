extends Button

func _ready():
	var creditMenuButton = %nextlevelbutton
	var coinDisplayLabel = %CoinUILabel
	coinDisplayLabel.text = str(Global.coinBalance)
	creditMenuButton.pressed.connect(_creditMenu_button_pressed)
		
func _creditMenu_button_pressed():
	if Global.level >= 1 and Global.level <= 4:
			# updated level when body touched trophy
			get_tree().change_scene_to_file("res://scenes/levels/level" + str(Global.level) + ".tscn")
	else:
			print("Error, next level doesn't expist. Redirecting to main menu...")
			get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
