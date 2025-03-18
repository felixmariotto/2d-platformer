extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0
@export var PLAYER_ID = 0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("player0_jump") and PLAYER_ID == 0 and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("player1_jump") and PLAYER_ID == 1 and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	for i in 2:
		
		if PLAYER_ID != i:
			continue
		
		# Get the input direction and handle the movement/deceleration.
		
		var direction = Input.get_axis( "player%s_left" % i, "player%s_right" % i )
		
		if direction > 0.0:
			velocity.x = 1.0 * SPEED
		elif direction < 0.0:
			velocity.x = -1.0 * SPEED
		else:
			velocity.x = 0.0
	
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
