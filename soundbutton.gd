extends TextureButton
# need to look into audio bus more 
# will use for sound effects? 
var master_bus = AudioServer.get_bus_index("Master")

func _on_pressed() -> void:
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
