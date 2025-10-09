extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	if GameManager.level == 1:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("Player touched portal — loading SacrificeIntro")
		if GameManager.level == 1:
			get_tree().change_scene_to_file("res://SacrificeIntro.tscn")
		else: if GameManager.level == 2:
			get_tree().change_scene_to_file("res://Sacrifice_2.tscn")
			
