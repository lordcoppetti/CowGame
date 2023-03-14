extends Node2D

class_name Enemy

export (float) var speed = 100.0
onready var character_body = $KinematicBody2D
onready var animation = $KinematicBody2D/AnimationPlayer

var direction = Vector2()

func _ready():
	# set to move randomly left or right
	randomize()
	var xrand = rand_range(-1, 1)

	if xrand > 0:
		direction = Vector2(-1, 0)
	else:
		direction = Vector2(1, 0)
	
	randomize()
	var yrand = rand_range(-1, 1)

	if yrand > 0:
		direction = Vector2(direction.x, -1)
	else:
		direction = Vector2(direction.y, 1)
	
	direction = direction.normalized()

func _physics_process(delta):
	var velocity = direction * speed

	var collision = character_body.move_and_collide(velocity * delta)

	# bounce off walls
	if collision:
		var collision_normal = collision.normal
		direction = direction - collision_normal * 2 * direction.dot(collision_normal)


func _on_Area2D_body_entered(body:Node):
	if body.name == "KinematicBody2D" and body.get_parent().name == "Player":
		get_node("KinematicBody2D").get_node("Area2D").queue_free()
		body.input_vector = Vector2.ZERO
		body.set_physics_process(false)
		body.get_node("AnimationPlayer").play("die")

		direction = Vector2.ZERO
		animation.play("die")


func _on_AnimationPlayer_animation_finished(anim_name:String):
	queue_free()
	pass # Replace with function body.
