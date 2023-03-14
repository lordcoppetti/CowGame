extends Node2D

# var a = 2
# var b = "text"
signal emitter


# Called when the node enters the scene tree for the first time.
func _ready():
	something()

func something():
	emit_signal("emitter", [0, 5, 8])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
