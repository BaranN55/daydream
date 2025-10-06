extends Control

@onready var video: VideoStreamPlayer = $VideoPlayer
@onready var chapter1: Button = $Chapter1

func _ready():
	$Panel.visible = true
	$Chapter1.visible = true
	$Chapter2.visible = true
	$Chapter3.visible = true
	$Label.visible = true
	video.visible = false



func _on_chapter_1_pressed() -> void:
	print("hello")
	video.visible = true
	$Chapter1.visible = false
	$Chapter2.visible = false
	$Chapter3.visible = false
	$Panel.visible = false
	$Label.visible = false
	video.play()
	await video.finished
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
