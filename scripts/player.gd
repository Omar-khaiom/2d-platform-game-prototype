extends CharacterBody2D


const SPEED = 110.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	#get input direction - 1 ,0 , 1
	var direction := Input.get_axis(" mov_left", " mov_right")
	
	#flip sprite
	if direction >0 :
		animated_sprite.flip_h = false
	elif direction <0 :
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
			animated_sprite.play("jump")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
