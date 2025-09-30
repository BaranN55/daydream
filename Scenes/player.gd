extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim: AnimatedSprite2D = $Player   # adjust path if needed

var has_sword: bool = false
var last_direction: int = 1  # 1 = right, -1 = left
var attacking: bool = false

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Attack (play once)
	if has_sword and Input.is_action_just_pressed("attack"):
		attacking = true
		if last_direction < 0:
			anim.play("SwordLeft")
		else:
			anim.play("SwordRight")
		return   # stop normal movement while attack starts

	# If currently attacking and animation is still playing, don't override it
	if attacking:
		if not anim.is_playing():   # finished sword animation
			attacking = false
		else:
			move_and_slide()
			return

	# Movement input (normal if not attacking)
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		last_direction = direction

		# Running animations
		if last_direction < 0:
			anim.play("RunLeft")
		else:
			anim.play("RunRight")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Idle animations
		if last_direction < 0:
			anim.play("Flipped Idle")
		else:
			anim.play("Normal Idle")

	move_and_slide()


# Called when player picks up the sword
func pickup_sword() -> void:
	has_sword = true
	print("Sword collected!")
