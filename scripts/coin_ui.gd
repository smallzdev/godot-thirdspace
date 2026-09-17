extends Control

@onready var label = $Label

func _ready() -> void:
	Eventcontroller.connect("coin_collected", on_event_coin_collected)
	Eventcontroller.connect("remove_coin", on_event_coin_collected)
	#whenever coin collected happens: make sure to run 
	#on event coin collected

func reset_ui() -> void:
	label.text("0")

func on_event_coin_collected(amount: int) -> void:
	label.text = str(amount)
