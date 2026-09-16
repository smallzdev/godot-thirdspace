extends Control

@onready var label = $Label

func _ready() -> void:
	Eventcontroller.connect("coin_collected", on_event_coin_collected)
	

func on_event_coin_collected(amount: int) -> void:
	label.text = str(amount)
