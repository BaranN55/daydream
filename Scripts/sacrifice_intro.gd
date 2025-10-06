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
	# Hide sacrifice options and main button initially
	$Panel4.visible = false
	sacrifice_button.connect("pressed", Callable(self, "_on_sacrifice_pressed"))
	show_intro()
	for s in GameManager.active_sacrifices:
		if s == "Eyesight":
			var eyesight_scene = load("res://Sacrifices/Eyesight.tscn").instantiate()
			add_child(eyesight_scene)

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
	



func _on_eyesight_button_pressed() -> void:
	GameManager.apply_sacrifice("Eyesight")
	GameManager.add_time(10)
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")
