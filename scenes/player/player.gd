extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var speed := 200



func _physics_process(delta):
	var direction := Vector2.ZERO
	var animation := "" 

	# handle input & choose run animation
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animation = "running_east"
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animation = "running_west"
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		animation = "running_south"
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		animation = "running_north"

	#direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()


	if direction == Vector2.ZERO:
		sprite.stop()
	else:
		#if sprite.animation != animation:
		sprite.play(animation)
