extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var anim: AnimatedSprite2D = $Player   # change path if needed

var has_sword: bool = false
var last_direction: int = 1  # 1 = right, -1 = left

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
			anim.play("RunLeft")
		else:
			anim.play("RunRight")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		# Idle animations depend on last direction
		if last_direction < 0:
			anim.play("Flipped Idle")
		else:
			anim.play("Normal Idle")

	move_and_slide()

	# Attack input
	if has_sword and Input.is_action_just_pressed("attack"):
		attack()

# Called when player picks up the sword
func pickup_sword() -> void:
	has_sword = true
	print("Sword collected!")

# Sword attack
func attack() -> void:
	if last_direction < 0:
		anim.play("Flipped Idle")  # placeholder for AttackLeft
	else:
		anim.play("Normal Idle")   # placeholder for AttackRight

	print("Player swings the sword!")
