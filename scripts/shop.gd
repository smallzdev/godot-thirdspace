extends CanvasLayer

# Note: I know the code is a little all over the place, and I
# plan to fix that shortly. For now, it works so I'll keep it.

# shop panel.
@onready var shopPanel = $Panel
@onready var ProductIcon = $Panel/ProductIcon
@onready var ProductLabel = $Panel/ItemNameLabel
@onready var ProductCostLabel = $Panel/CostLabel
@onready var ProductIconAnimation = $Panel/ProductIcon.animation.to_int()
@onready var coinBalanceLabel = %CoinUILabel

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
	
	# temporary for now, moving soon.
	coinBalanceLabel.text = str(Global.coinBalance)

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
	if ProductIconAnimation == 1:
		print("End of the left swap thing")
	else:
		ProductIconAnimation -= 1
		ProductIcon.animation = str(ProductIconAnimation)
		
		# GUI Updating
		if ProductIconAnimation == 1:
			ProductCostLabel.text = "Cost: 15 Coins"
			ProductLabel.text = "Temp Heart"
		if ProductIconAnimation == 2:
			ProductLabel.text = "Placeholder 1"
			ProductCostLabel.text = "Cost: 16 Coins"
		if ProductIconAnimation == 3:
			ProductLabel.text = "Placeholder 2"
			ProductCostLabel.text = "Cost: 2 Coins"

func nextright_button_pressed():
	if ProductIconAnimation == 3:
		print("End of right slide product or wtv")
	else:
		ProductIconAnimation += 1
		ProductIcon.animation = str(ProductIconAnimation)
		
		# GUI Updating for each product.
		if ProductIconAnimation == 1:
			ProductCostLabel.text = "Cost: 15 Coins"
			ProductLabel.text = "Temp Heart"
		if ProductIconAnimation == 2:
			ProductLabel.text = "Placeholder 1"
			ProductCostLabel.text = "Cost: 16 Coins"
		if ProductIconAnimation == 3:
			ProductLabel.text = "Placeholder 2"
			ProductCostLabel.text = "Cost: 2 Coins"

# Shop purchasing system and button
func purchase_activated():
	if ProductIconAnimation == 1:
		ProductCostLabel.text = "Cost: 15 Coins"
		ProductLabel.text = "Temp Heart"
	if ProductIconAnimation == 2:
		ProductLabel.text = "Placeholder 1"
		ProductCostLabel.text = "Cost: 16 Coins"
	if ProductIconAnimation == 3:
		ProductLabel.text = "Placeholder 2"
		ProductCostLabel.text = "Cost: 2 Coins"
	else:
		print("Error, product ", ProductIconAnimation, " not found.")
	# ill do this later
