extends ColorRect

@onready var mat := material as ShaderMaterial

func _ready():
	update_eyesight()

func update_eyesight():
	var level: int = GameManager.sacrifice_level("Eyesight")
	var darkness: float = clamp(0.25 * level, 0.0, 0.9)
	mat.set_shader_parameter("darkness", darkness)
	print("Eyesight shader darkness:", darkness)
