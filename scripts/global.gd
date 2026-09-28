extends Node

# coins collected in a scene without finishing:
var coins = 0

# coins successfully collected:
var coinBalance = 0

var checkpointNumber = 0
var lives = 3
var level = 1

func add_coins(amount: int) -> void:
	Global.coins += amount
	print("# Coins: ", Global.coins)
	Eventcontroller.emit_signal("coin_collected", Global.coins)
	#pass "coin_collected" and value of "coins"
	
func remove_all_coins(amount: int) -> void:
	Global.coins = 0
	print("No more coins: ", Global.coins)
	Eventcontroller.emit_signal("remove_coin", Global.coins)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
