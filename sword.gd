extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		# Call the pickup_sword() function on the player
		if body.has_method("pickup_sword"):
			body.pickup_sword()

		# Remove the sword from the scene
		queue_free()
