extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var label: Label = $Label

signal time_up  # This signal will tell the level that time is over

# Call this from your level to start the timer
func start_timer(seconds: float) -> void:
	timer.wait_time = seconds
	timer.start()

# Updates the label text every frame
func _process(_delta: float) -> void:
	label.text = str(int(timer.time_left))

# When timer hits zero, send a signal
func _on_Timer_timeout() -> void:
	emit_signal("time_up")


func _on_timer_timeout() -> void:
	pass # Replace with function body.
	#hello
