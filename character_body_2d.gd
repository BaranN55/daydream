extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim: AnimatedSprite2D = $Player
@onready var character: CharacterBody2D = $"."


func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement (left/right)
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			if anim.animation != "Flipped Idle":
				anim.play("Flipped Idle")
		else:
			if anim.animation != "Normal Idle":
				anim.play("Normal Idle")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_triggrezone_area_entered(area: Area2D) -> void:
	print ('test')
