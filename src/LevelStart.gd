extends Node2D

class_name LevelStart


onready var player : CharacterBody = get_parent().get_node("Player").get_node("KinematicBody2D")
onready var enemies : Array = get_parent().get_node("Enemies").get_children()
onready var label : Label = get_node("Label")


# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	# turn off the players and enemies physics process
	# we do this to give some time to start the level
	player.set_physics_process(false)
	for enemy in enemies:
		enemy.set_physics_process(false)
	label.text = "Level " + str(Main.level)
	label.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	player.set_physics_process(true)
	for enemy in enemies:
		enemy.set_physics_process(true)
	label.hide()
	queue_free()
