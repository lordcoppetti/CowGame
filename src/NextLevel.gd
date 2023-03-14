extends Node2D

class_name NextLevel

onready var label : Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Level" + str(Main.world) + ":" + str(Main.level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
