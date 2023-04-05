extends Node

var level = 1

func _ready():
	# Create a new AudioStreamPlayer node
	var music = AudioStreamPlayer.new()

	# Load the music file
	#var music_file = "res://sounds/lofi-loop.mp3"
	var music_file = "res://sounds/kinda-lofi.mp3"
	var music_stream = load(music_file)

	# Set the sound to the loaded stream
	music.stream = music_stream

	# Add the sound to the scene tree
	add_child(music)

	# Play the sound
	music.play()
