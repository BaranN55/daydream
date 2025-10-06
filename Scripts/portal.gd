extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("Player touched portal — loading SacrificeIntro")
		get_tree().change_scene_to_file("res://SacrificeIntro.tscn")
