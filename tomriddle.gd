extends Node2D

@onready var wrong_answer_label = $WrongAnswerLabel  

func _ready():
	# Hide the label at the start
	wrong_answer_label.visible = false

func show_wrong_answer():
	wrong_answer_label.visible = true
	
	# Hide the label again after 2 seconds
	await get_tree().create_timer(2.0).timeout
	wrong_answer_label.visible = false

func _on_variable_pressed() -> void:
	# Correct answer
	get_tree().change_scene_to_file("res://lev_1_sacri.tscn")

func _on_hard_drive_pressed() -> void:
	show_wrong_answer()

func _on_compiler_pressed() -> void:
	show_wrong_answer()

func _on_stack_pressed() -> void:
	show_wrong_answer()
