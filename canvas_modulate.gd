extends CanvasModulate

@export var base_darkness: float = 0.25
@export var worsen_amount: float = 0.50

func _ready():
	update_eyesight()

func update_eyesight():
	var level = GameManager.sacrifice_level("Eyesight")
	var darkness = clamp(base_darkness + worsen_amount * level, 0.0, 0.95)
	var brightness = 1.0 - darkness
	color = Color(brightness, brightness, brightness, 1.0)
