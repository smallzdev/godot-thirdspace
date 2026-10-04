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
@onready var livesLabel = $"../../CanvasLayer2/HeartUI/LivesLabel"
@onready var errorPanel = $Panel/ErrrorPopup
@onready var errorTitle = $Panel/ErrrorPopup/ErrorTitle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# all da button variables
	var shopcloseButton = %XButton
	var nextLeftButton = $Panel/NextLeft
	var nextRightButton = $Panel/NextRight
	var purchaseButton = $Panel/PurchaseButton
	var ErrorButton = $Panel/ErrrorPopup/CloseErrorButton
	
	get_node("Panel/ErrrorPopup").hide()
	
	# detects if a button is pressed, and then activates the func.
	shopcloseButton.pressed.connect(shopcloseButton_pressed)
	nextLeftButton.pressed.connect(nextleft_button_pressed)
	nextRightButton.pressed.connect(nextright_button_pressed)
	purchaseButton.pressed.connect(purchase_activated)
	ErrorButton.pressed.connect(error_dismissed)
	
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
			ProductCostLabel.text = "Cost: 1 Coins"
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
			ProductCostLabel.text = "Cost: 1 Coins"
		if ProductIconAnimation == 3:
			ProductLabel.text = "Placeholder 2"
			ProductCostLabel.text = "Cost: 2 Coins"
		else:
			print("Error, product ", ProductIconAnimation, " not found..")

# Shop purchasing system and button
func purchase_activated():
	if ProductIconAnimation == 1:
		if Global.coinBalance >= 15:
			Global.coinBalance -= 15
			Global.lives += 1
			livesLabel.text = str(Global.lives)
			coinBalanceLabel.text = str(Global.coinBalance)
		else:
			errorPanel.visible = true
	if ProductIconAnimation == 2:
		if Global.coinBalance >= 1:
			Global.coinBalance -= 1
			Global.max_jump += 1
			livesLabel.text = str(Global.lives)
			coinBalanceLabel.text = str(Global.coinBalance)
			# need to remove option to buy again
			# or increase price after bought
		else:
			errorPanel.visible = true
	if ProductIconAnimation == 3:
		errorPanel.visible = true
		errorTitle.text = "Under Construction"
		# its currently a placeholder so nothings here

func error_dismissed():
	errorPanel.visible = false
	# resseting to default text:
	errorTitle.text = "Insufficient Balance"
