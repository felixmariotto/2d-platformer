extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# Animation handling
	if not is_on_floor():
		var realVelocity = get_real_velocity()
		if realVelocity.y > 0 :
			$AnimatedSprite2D.play("fall")
		else :
			$AnimatedSprite2D.play("jump")
	else:
		if direction:
			$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = velocity.x < 0
		else:
			$AnimatedSprite2D.play("idle")


func _on_collectibles_collected(message: String) -> void:
	print("bla")
