extends Node

# how many times each sacrifice was chosen
var sacrifice_levels: Dictionary = {
	"Eyesight": 0,
	"Balance": 0,
	"Control": 0
}

# global extra time pool
var total_time: float = 0.0

func apply_sacrifice(name: String) -> void:
	if sacrifice_levels.has(name):
		sacrifice_levels[name] += 1
		print("Sacrifice applied:", name, "-> level", sacrifice_levels[name])

func sacrifice_level(name: String) -> int:
	return sacrifice_levels.get(name, 0)

func has_sacrifice(name: String) -> bool:
	return sacrifice_levels.get(name, 0) > 0

func add_time(seconds: float) -> void:
	total_time += seconds
	print("Added", seconds, "seconds. Total time:", total_time)

func get_total_time() -> float:
	return total_time
