extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim: AnimatedSprite2D = $Player
@onready var character: CharacterBody2D = $"." 

var last_direction := 1  # 1 = right, -1 = left

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement input
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
		last_direction = direction

		# Running animations
		if direction < 0:
			if anim.animation != "RunLeft":
				anim.play("RunLeft")
		elif direction > 0:
			if anim.animation != "RunRight":
				anim.play("RunRight")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

		# Idle animations when stopping
		if last_direction < 0:
			if anim.animation != "Flipped Idle":
				anim.play("Flipped Idle")
		elif last_direction > 0:
			if anim.animation != "Normal Idle":
				anim.play("Normal Idle")

	move_and_slide()


func _on_triggrezone_area_entered(area: Area2D) -> void:
	print("test")


func _on_collision_shape_2d_body_entered() -> void:
	if character.is_in_group("Player"):  # or check if body.name == "Player"
		$CanvasLayer.visible = true
		get_tree().paused = true
