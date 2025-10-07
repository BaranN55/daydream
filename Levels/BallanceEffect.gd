extends Camera2D

@export var wobble_strength := 15.0
@export var wobble_speed := 15.0
var base_offset := Vector2.ZERO

func _ready():
	base_offset = offset  # store original camera position

func _process(delta):
	if GameManager.balance_sacrificed:
		var wobble_x = sin(Time.get_ticks_msec() / 1000.0 * wobble_speed) * wobble_strength
		var wobble_y = cos(Time.get_ticks_msec() / 1100.0 * wobble_speed) * (wobble_strength * 0.6)
		offset = base_offset + Vector2(wobble_x, wobble_y)
	else:
		offset = lerp(offset, base_offset, 0.1)
