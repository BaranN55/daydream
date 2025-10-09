extends CharacterBody2D


const SPEED = 725.0
const JUMP_VELOCITY = -650.0
const CLIMB_SPEED = 570.0

const WALL_SLIDE_SPEED = 300.0
const WALL_JUMP_FORCE = Vector2(400, -550)

@onready var left_wall_check: RayCast2D = $LeftWallCheck
@onready var right_wall_check: RayCast2D = $RightWallCheck
@onready var anim: AnimatedSprite2D = $Player
@onready var character: CharacterBody2D = $"."
@onready var cam: Camera2D = $Camera2D

var last_direction := 1
var input_delay := 0.0
var stored_direction := 0
var jump_buffer := 0.0
var jump_delay := 0.0
var is_climbing = false
var on_wall = false

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
		if input_delay > 0.23: # delay between input updates
			stored_direction = direction
			input_delay = 0.0
		direction = stored_direction
		velocity.x = lerp(velocity.x, direction * SPEED * 0.7, 0.03)
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
	
	on_wall = (left_wall_check.is_colliding() or right_wall_check.is_colliding()) and not is_on_floor()
	

	if on_wall:
	# Slow vertical fall when sliding down the wall
		if velocity.y > WALL_SLIDE_SPEED:
			velocity.y = WALL_SLIDE_SPEED
	
	# Climb up when pressing up or W
		if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_J):
			is_climbing = true
			velocity.y = -CLIMB_SPEED
		else:
			is_climbing = false
	
	# Wall jump (optional)
		if Input.is_action_just_pressed("ui_accept"):  # or jump key
			var jump_dir = 1 if left_wall_check.is_colliding() else -1
			velocity = Vector2(WALL_JUMP_FORCE.x * jump_dir, WALL_JUMP_FORCE.y)
	else:
		is_climbing = false
		
	if is_climbing:
		velocity.y = -CLIMB_SPEED
	elif on_wall:
		velocity.y = min(velocity.y + get_gravity().y * 0.3 * delta, WALL_SLIDE_SPEED)


	move_and_slide()
