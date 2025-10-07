extends Node

var sacrifice_levels = {
	"Eyesight": 0,
	"Balance": 0,
	"Control": 0
}

func apply_sacrifice(name: String):
	if sacrifice_levels.has(name):
		sacrifice_levels[name] += 1
		print("Sacrifice applied:", name, "-> level", sacrifice_levels[name])

func sacrifice_level(name: String) -> int:
	return sacrifice_levels.get(name, 0)

func has_sacrifice(name: String) -> bool:
	return sacrifice_levels.get(name, 0) > 0
