extends Actor


func _physics_process(delta):
	var direction: = getDir()	
	velocity = calcVel(velocity, speed, direction)
	velocity = move_and_slide(velocity, Vector2.UP)

func calcVel(
	linear_velocity: Vector2, 
	speed: Vector2,
	direction: Vector2) -> Vector2:
	var newVel: = linear_velocity
	
	newVel.x = speed.x * direction.x
	newVel.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		newVel.y = speed.y * direction.y
	
	return newVel

func getDir() -> Vector2:
	return Vector2(
		Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.50
	)
