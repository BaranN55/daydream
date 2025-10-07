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
	$Size.visible = false
	$Speed.visible = false
	$Zoom.visible = false

	audio.play()
	await get_tree().create_timer(2.3).timeout
	$Text2.visible = true
	$Text1.visible = false
	await audio.finished
	$Panel4.visible = true

func _on_sacrifice_button_pressed() -> void:
	if GameManager.eyesight_darkness == 0:
		$EyesightPanel.visible = true
	else:
		$Size.visible = true
	if GameManager.balance_sacrificed == false:
		$BalancePanel.visible = true
	else:
		$Speed.visible = true
	if GameManager.control_sacrificed == false:
		$ControlPanel.visible = true
	else:
		$Zoom.visible = true
		
	#$Panel3.visible = false
	#$Panel4.visible = false
	#$Choose.visible = true
	#$Congrats.visible = false
	#$Text2.visible = false
	#$EyesightPanel.visible = true
	#$BalancePanel.visible = true
	#$ControlPanel.visible = true


# Eyesight sacrifice button
func _on_eyesight_button_pressed():
	GameManager.eyesight_darkness = 0.5  # 30% darker forever
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")

# Balance sacrifice button (optional)
func _on_balance_button_pressed():
	GameManager.balance_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")

# Control sacrifice button (optional)
func _on_control_button_pressed():
	GameManager.control_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")
