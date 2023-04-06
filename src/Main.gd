extends Node

var level = 1 # Total levels: 30
var timer = 0
var total_secs = 0
var total_mins = 0
var music_changed = false
var music
var music2

func _ready():
	# Create a new AudioStreamPlayer node
	music = AudioStreamPlayer.new()

	# Load the music file
	#var music_file = "res://sounds/lofi-loop.mp3"
	var music_file = "res://sounds/lofi-loop.mp3"
	var music_stream = load(music_file)

	# Set the sound to the loaded stream
	music.stream = music_stream

	# Add the sound to the scene tree
	add_child(music)

	# Play the sound
	music.play()


func _process(delta):
	if level == 15 and not music_changed:
		# Change the music
		music_changed = true
		music.stop()
		var music2 = AudioStreamPlayer.new()
		var music_file = "res://sounds/kinda-lofi.mp3"
		var music_stream = load(music_file)

		# Set the sound to the loaded stream
		music2.stream = music_stream

		# Add the sound to the scene tree
		add_child(music2)

		# Play the sound
		music2.play()

	if level == 31:
		# The game is over, you beat it
		# Level 30 adds +1 when you beat it so it ends in 31
		pass

	timer += delta
	if timer >= 1.0:
		total_secs += 1
		timer = 0
	if total_secs >= 60:
		total_mins += 1
		total_secs = 0
