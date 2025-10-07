extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -560.0

@onready var anim: AnimatedSprite2D = $Player
@onready var character: CharacterBody2D = $"."
@onready var cam: Camera2D = $Camera2D

var last_direction := 1
var input_delay := 0.0
var stored_direction := 0
var jump_buffer := 0.0
var jump_delay := 0.0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# --- Control sacrifice adds input delay ---
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction == 0:
		if Input.is_key_pressed(KEY_A):
			direction = -1
		elif Input.is_key_pressed(KEY_D):
			direction = 1

	if GameManager.control_sacrificed:
		# delayed response to movement
		input_delay += delta
		if input_delay > 0.31: # delay between input updates
			stored_direction = direction
			input_delay = 0.0
		direction = stored_direction
		velocity.x = lerp(velocity.x, direction * SPEED * 0.7, 0.015)
	else:
		velocity.x = direction * SPEED

	# --- Jump (with delay under control sacrifice) --- 
	if GameManager.control_sacrificed:
		if (Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_W)) and is_on_floor():
			jump_buffer = 0.31 # wait 0.15 sec before jumping
		if jump_buffer > 0:
			jump_buffer -= delta
			if jump_buffer <= 0:
				velocity.y = JUMP_VELOCITY
	else:
		if (Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_W)) and is_on_floor():
			velocity.y = JUMP_VELOCITY

	# --- Animations ---
	if direction != 0:
		last_direction = direction
		if direction < 0:
			if anim.animation != "RunLeft":
				anim.play("RunLeft")
		elif direction > 0:
			if anim.animation != "RunRight":
				anim.play("RunRight")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if last_direction < 0:
			if anim.animation != "Flipped Idle":
				anim.play("Flipped Idle")
		elif last_direction > 0:
			if anim.animation != "Normal Idle":
				anim.play("Normal Idle")

	move_and_slide()
