extends Sprite

class_name WinItem

signal item_collected

onready var area2d = $Area2D
onready var animation = $AnimationPlayer

export var item_name = "win item"

func _ready():
	scale = Vector2(1, 1)
	area2d.connect("body_entered", self, "on_body_entered")

func on_body_entered(body):
	# if the body is a player, emit a signal
	var object = body.get_parent()
	if object is Player:
		emit_signal("item_collected", item_name)
		# Play the disappear animation
		animation.play("destroy")


func _on_AnimationPlayer_animation_finished(anim_name:String):
	queue_free()


func _on_AnimationPlayer_animation_started(anim_name:String):
	get_node("Area2D").queue_free()
