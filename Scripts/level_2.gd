extends Node2D

@onready var overlay: ColorRect = $Player/EyesightOverlay

func _ready():
	var darkness = GameManager.eyesight_darkness
	overlay.color = Color(0, 0, 0, darkness)
