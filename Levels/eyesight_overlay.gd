extends ColorRect

@export var base_alpha := 0.0      # starts clear
@export var worsen_amount := 0.5   # amount it darkens per sacrifice

func _ready():
	update_eyesight()

func update_eyesight():
	var level := GameManager.sacrifice_level("Eyesight")
	color = Color(0, 0, 0, clamp(base_alpha + worsen_amount * level, 0.0, 1.0))
