extends Node2D

class_name Player

onready var character_body = $CharacterBody

signal game_over

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AnimationPlayer_animation_finished(anim_name:String):
	emit_signal("game_over")
	queue_free()
