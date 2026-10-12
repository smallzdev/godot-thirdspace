extends Button

@onready var textLabel = %labeltextslide
# ^^^ the label to update
var textSlideNumber = 0

func _ready():
	var nextButton = %nextButton
	var prevButton = %previousButton
	nextButton.pressed.connect(next_button_pressed)
	prevButton.pressed.connect(prev_button_pressed)
	
# for the next button to shuffle slides
func next_button_pressed():
	textSlideNumber +=1
	if textSlideNumber == 1:
		textLabel.text = str("However you aren't done yet...")
	if textSlideNumber == 2:
		textLabel.text = str("Soon more levels will be created, causing more adventures...")
	if textSlideNumber == 3:
		textLabel.text = str("Now go on young explorer, and explore the world!")
	if textSlideNumber == 4:
		textLabel.text = str("Select an option.")
	if textSlideNumber >= 5:
		textSlideNumber = 5

# for the previous button to shuffle slides
func prev_button_pressed():
	textSlideNumber -= 1
	if textSlideNumber <= 1:
		textSlideNumber = 1
	if textSlideNumber == 1:
		textLabel.text = str("However you aren't done yet...")
	if textSlideNumber == 2:
		textLabel.text = str("Soon more levels will be created, causing more adventures...")
	if textSlideNumber == 3:
		textLabel.text = str("Now go on young explorer, and explore the world!")
	if textSlideNumber == 4:
		textLabel.text = str("Select an option.")
	
