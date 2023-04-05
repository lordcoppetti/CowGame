extends Node2D

class_name Level

export var next_level_path : String = "res://Levels/Level.tscn"

var items
var keys = 0
var win_items_remaining = 0
var game_over = false
var level_passed = false

onready var player : Player = get_node("Player")
onready var enemies : Array = get_node("Enemies").get_children()
onready var end_level_timer : Timer = get_node("EndLevelTimer")

func _ready():
	# Obtain all the items from the items node
	items = get_node("Items").get_children()
	for item in items:
		win_items_remaining += 1
		item.connect("item_collected", self, "on_item_collected")

func on_item_collected(object):
	win_items_remaining -= 1
	if object == "key item":
		# TODO: Add 1 to keys
		keys += 1
		pass

	# Win condition
	if win_items_remaining == 0:
		end_level_timer.start()
		var body : CharacterBody = player.get_node("KinematicBody2D")
		body.set_physics_process(false)
		body.sprite.play("idle")
		for enemy in enemies:
			enemy.set_physics_process(false)

func next_level():
	level_passed = true

	Main.level += 1

	if Main.level == 31:
		pass
		# Finish game
		# TODO

	# Load next level scene resource
	get_tree().change_scene(next_level_path)


func _input(event):
	if event.is_action_pressed("restart") and game_over:
		# reset scene
		get_tree().reload_current_scene()



func _on_Player_game_over():
	get_node("GameOver").show()
	game_over = true


func _on_EndLevelTimer_timeout():
	next_level()
