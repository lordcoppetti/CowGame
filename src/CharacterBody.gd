extends KinematicBody2D

class_name CharacterBody

export (float) var speed = 250.0

onready var sprite = $AnimatedSprite

var input_vector = Vector2()

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# Obtain input from controller or keyboard
	input_vector = Vector2()
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	
	# Flip sprite
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true
	
	# Update sprite animation
	if input_vector.length() > 0:
		sprite.play("run")
	else:
		sprite.play("idle")

	move_and_slide(input_vector * speed)