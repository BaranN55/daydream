extends CanvasLayer

@onready var text_label: Label = $Congrats
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var sacrifice_button: Button = $Panel4/SacrificeButton

var sacrifice_data = {
	"Eyesight": {"time": 10},
	"Balance": {"time": 8},
	"Control": {"time": 6}
}

func _ready():
	$Panel4.visible = false
	sacrifice_button.connect("pressed", Callable(self, "_on_sacrifice_pressed"))
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

func _on_eyesight_button_pressed():
	print("Sacrificed eyesight.")
	GameManager.apply_sacrifice("Eyesight")
	GameManager.add_time(10)

	# Optional: store the eyesight effect intensity immediately
	GameManager.set_sacrifice_strength("Eyesight", 1)  # You can make it stronger later

	# Preload Level2, activate overlay before showing it
	var next_level = load("res://Levels/Level2.tscn").instantiate()

	if next_level.has_node("EyesightOverlay"):
		var overlay = next_level.get_node("EyesightOverlay")
		var level = GameManager.sacrifice_level("Eyesight")
		var alpha = clamp(0.25 + 0.2 * level, 0.0, 1.0)
		overlay.color = Color(0, 0, 0, alpha)
		print("Applied eyesight overlay immediately, alpha:", alpha)

	get_tree().root.add_child(next_level)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = next_level
