extends Node

var coins = 0
var checkpointNumber = 0

func add_coins(amount: int) -> void:
	coins+=amount
	print("# Coins: ", coins)
	Eventcontroller.emit_signal("coin_collected", coins)
	#pass "coin_collected" and value of "coins"
	
func remove_all_coins(amount: int) -> void:
	coins = 0
	print("No more coins: ", coins)
	Eventcontroller.emit_signal("remove_coin", coins)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
