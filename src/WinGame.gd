extends Node2D

class_name WinGame


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var label = get_node("Label2")
	label.text = "Total Time:\n" + str(Main.total_mins) + ":" + str(Main.total_secs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
