extends CanvasLayer

@export var initial_alpha: float = 0.3
@export var max_alpha: float = 0.7
@export var fade_speed: float = 0.02  # how fast darkness increases

var mask: ColorRect

func _ready():
	var viewport_size = get_viewport().get_visible_rect().size

	mask = ColorRect.new()
	mask.color = Color(0, 0, 0, initial_alpha)
	mask.size = viewport_size
	mask.anchor_left = 0
	mask.anchor_top = 0
	mask.anchor_right = 1
	mask.anchor_bottom = 1
	mask.mouse_filter = Control.MOUSE_FILTER_IGNORE
	mask.z_index = 100  # put the mask above other UI
	add_child(mask)

	fade_in()

func fade_in():
	await get_tree().create_timer(1.0).timeout
	while mask.color.a < max_alpha:
		mask.color.a += fade_speed
		await get_tree().create_timer(0.5).timeout
