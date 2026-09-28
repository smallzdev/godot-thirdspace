extends TextureButton
# need to look into audio bus more 
# will use for sound effects? 
var master_bus = AudioServer.get_bus_index("Master")

# physical interaction by clicking the button
func _on_pressed() -> void:
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))

# key interaction where m, and k keys are pressed
func _on_mute_key() -> void:
	if Input.is_action_just_pressed("mute"):
		AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
