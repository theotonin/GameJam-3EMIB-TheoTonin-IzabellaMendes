extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#variaveis 
var pulos = 0
var puloGeral = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and pulos < 3:
		velocity.y = JUMP_VELOCITY
		pulos += 1
		puloGeral += 1
	# Get the input direction and handle the movement/deceleration.
	var direction = 1 
	
	# Inverte o sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Altera a animação
	if is_on_floor():	
		pulos = 0
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
		if SPEED == 0: # bateu em algo, para e aparece mais coisa
			direction = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
