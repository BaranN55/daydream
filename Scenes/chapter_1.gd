extends Button
@onready var video: VideoStreamPlayer = $"../VideoPlayer"


func _on_pressed() -> void:
	print("Chapter button pressed!")
	$Panel.visible = false
	$HBoxContainer.visible = false
	$Label.visible = false
	video.play()
	await video.finished
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
