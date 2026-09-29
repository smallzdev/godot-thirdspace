extends CanvasLayer

@onready 	var shopPanel = $Panel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var shopcloseButton = %TextureButton
	shopcloseButton.pressed.connect(shopcloseButton_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# buttons - specifically close for now

func shopcloseButton_pressed():
	get_tree().paused = false
	shopPanel.visible = false
