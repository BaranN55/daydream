extends Node2D

func _ready():
	if GameManager.sacrifice_level("Eyesight") > 0:
		var overlay = $EyesightOverlay  # name of your ColorRect node
		if overlay:
			var level = GameManager.sacrifice_level("Eyesight")
			var alpha = clamp(0.25 + 0.2 * level, 0.0, 1.0)
			overlay.color = Color(0, 0, 0, alpha)
			print("Eyesight active, alpha =", alpha)
	else:
		# disable overlay if no eyesight sacrifice
		if has_node("EyesightOverlay"):
			$EyesightOverlay.visible = false
