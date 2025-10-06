extends Node

# Total extra time earned from sacrifices
var total_time: float = 0

# List of active sacrifices (each name is unique)
var active_sacrifices: Array = []

# Adds extra time gained from a sacrifice
func add_time(seconds: float) -> void:
	total_time += seconds
	print("Added", seconds, "seconds. Total time:", total_time)

# Applies a new sacrifice (only once)
func apply_sacrifice(name: String) -> void:
	if name not in active_sacrifices:
		active_sacrifices.append(name)
		print("Applied sacrifice:", name)
	else:
		print("Sacrifice already active:", name)

# Checks if a sacrifice is active
func has_sacrifice(name: String) -> bool:
	return name in active_sacrifices
