extends CanvasModulate

@export var base_darkness: float = 0.25   # base dim level
@export var worsen_amount: float = 0.20   # how much darker each sacrifice makes it

func _ready():
	update_eyesight()  # called once when loaded

func update_eyesight():
	# Get how many times eyesight was sacrificed
	var level: int = GameManager.sacrifice_level("Eyesight")

	# Calculate how dark it should be
	var total_darkness: float = clamp(base_darkness + worsen_amount * level, 0.0, 0.95)
	var brightness: float = 1.0 - total_darkness

	color = Color(brightness, brightness, brightness, 1.0)
	print("Eyesight updated → Level:", level, "Brightness:", brightness)
