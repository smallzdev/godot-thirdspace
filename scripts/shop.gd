extends CanvasLayer

# shop panel.
@onready 	var shopPanel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# all da button variables
	var shopcloseButton = %XButton
	var nextLeftButton = $Panel/NextLeft
	var nextRightButton = $Panel/NextRight
	var purchaseButton = $Panel/PurchaseButton
	
	# detects if a button is pressed, and then activates the func.
	shopcloseButton.pressed.connect(shopcloseButton_pressed)
	nextLeftButton.pressed.connect(nextleft_button_pressed)
	nextRightButton.pressed.connect(nextright_button_pressed)
	purchaseButton.pressed.connect(purchase_activated)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# buttons :D
# -------------------

# Shop close button
func shopcloseButton_pressed():
	get_tree().paused = false
	shopPanel.visible = false

# Left, right item changing
func nextleft_button_pressed():
	pass
	# ill do this laterr

func nextright_button_pressed():
	pass
	# im doing this later

# Shop purchasing system and button
func purchase_activated():
	pass
	# ill do this later
