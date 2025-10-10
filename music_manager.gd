extends Node

var music_player: AudioStreamPlayer

func _ready():
	# Prevent duplicates
	if get_tree().root.has_node("MusicManagerInstance"):
		queue_free()
		return

	name = "MusicManagerInstance"

	# Find or create AudioStreamPlayer safely
	music_player = get_node_or_null("AudioStreamPlayer")
	if not music_player:
		music_player = AudioStreamPlayer.new()
		add_child(music_player)

	music_player.stream = load("res://Sounds/SoundTrack2.mp3") # make sure path is correct
	music_player.volume_db = -2
	music_player.autoplay = false
	music_player.play()
