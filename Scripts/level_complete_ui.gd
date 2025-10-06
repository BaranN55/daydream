extends CanvasLayer

func _ready():
	visible = false  # Hidden by default

func show_ui():
	visible = true
	get_tree().paused = true

func _on_Button_pressed():
	get_tree().paused = false
	visible = false
