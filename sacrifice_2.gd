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
	if GameManager.eyesight_sacrificed == true:
		$EyesightPanel.visible = false
		$Size.visible = true
	else:
		$EyesightPanel.visible = true
		$Size.visible = false
	if GameManager.balance_sacrificed == false:
		$BalancePanel.visible = true
		$Speed.visible = false

	else:
		$Speed.visible = true
		$BalancePanel.visible = false
	if GameManager.control_sacrificed == false:
		$ControlPanel.visible = true
		$Zoom.visible = false
	else:
		$Zoom.visible = true
		$ControlPanel.visible = false
	$Panel3.visible = false
	$Panel4.visible = false
	$Choose.visible = true
	$Congrats.visible = false
	$Text2.visible = false
	


# Eyesight sacrifice button
func _on_eyesight_button_pressed():
	GameManager.eyesight_darkness = 0.5  # 30% darker forever
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")

# Balance sacrifice button (optional)
func _on_balance_button_pressed():
	GameManager.balance_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")

# Control sacrifice button (optional)
func _on_control_button_pressed():
	GameManager.control_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")

func _on_size_button_pressed() -> void:
	GameManager.size_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")
	
func _on_speed_button_pressed() -> void:
	GameManager.speed_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")

func _on_zoom_button_pressed() -> void:
	GameManager.zoom_sacrificed = true
	get_tree().change_scene_to_file("res://Levels/Level3.tscn")
