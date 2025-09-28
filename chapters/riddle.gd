extends Button


func _on_pressed() -> void:
	$"../CanvasLayer".visible = true;
	print('button press detected');
