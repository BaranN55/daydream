extends Node2D

@onready var overlay: ColorRect = $Player/EyesightOverlay

func _ready():
	GameManager.level = 2
	var darkness = GameManager.eyesight_darkness
	overlay.color = Color(0, 0, 0, darkness)
