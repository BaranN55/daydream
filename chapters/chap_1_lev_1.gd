extends Node2D
$CanvasLayer/Control.visible = false

func _on_riddle_pressed():
	$CanvasLayer/Control.visible = true
