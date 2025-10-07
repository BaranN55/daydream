extends CanvasLayer

@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	$Panel4.visible = false
	show_intro()

func show_intro():
	$Congrats.visible = true
	$Text1.visible = true
	$Text2.visible = false
	$Panel4.visible = false
	$EyesightPanel.visible = false
	$BalancePanel.visible = false
	$ControlPanel.visible = false
	$Choose.visible = false
	$Panel3.visible = true
	$Panel2.visible = true

	audio.play()
	await get_tree().create_timer(4.7).timeout
	$Text2.visible = true
	$Text1.visible = false
	await audio.finished
	$Panel4.visible = true

func _on_sacrifice_pressed():
	$Panel3.visible = false
	$Panel4.visible = false
	$Choose.visible = true
	$Congrats.visible = false
	$Text2.visible = false
	$EyesightPanel.visible = true
	$BalancePanel.visible = true
	$ControlPanel.visible = true

# Eyesight sacrifice button
func _on_eyesight_button_pressed():
	GameManager.apply_sacrifice("Eyesight")
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")

# Balance sacrifice button (optional)
func _on_balance_button_pressed():
	GameManager.apply_sacrifice("Balance")
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")

# Control sacrifice button (optional)
func _on_control_button_pressed():
	GameManager.apply_sacrifice("Control")
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")
