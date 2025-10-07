extends Node2D

@onready var overlay: ColorRect = $EyesightOverlay

func _ready():
	if GameManager.has_sacrifice("Eyesight"):
		overlay.visible = true
		overlay.update_eyesight()
	else:
		overlay.visible = false
