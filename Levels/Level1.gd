extends Node2D

@onready var player = $Player
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var dead1g = GameManager.dead1
@onready var dead_audio: AudioStreamPlayer = $DeadAudio

func _ready():
	GameManager.level = 1
	if dead1g == false:
		audio.play()
	else:
		pass
# Called when hazard area is touched
func _on_Hazard_body_entered(body):
	if body.is_in_group("Player"):
		# Respawn the player at start
		body.position = Vector2(61, -55)

# Called when goal area is touched
func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		print("Level Complete!")
	# load next level if you want:
	# get_tree().change_scene_to_file("res://chapters/chap_1_lev_2.tscn")
