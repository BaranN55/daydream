extends CharacterBody2D
@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO  # use the built-in property, no "var velocity" at the top

	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed

	move_and_slide()
