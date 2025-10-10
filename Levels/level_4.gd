extends Node2D

@onready var overlay: ColorRect = $Player/EyesightOverlay

func _ready():
	GameManager.level = 4
	var darkness = GameManager.eyesight_darkness
	overlay.color = Color(0, 0, 0, darkness)
	if GameManager.size_sacrificed:
		_shrink_player()

func _shrink_player():
	var player = $Player
	if player:
		player.scale -= Vector2(0.3, 0.3)
