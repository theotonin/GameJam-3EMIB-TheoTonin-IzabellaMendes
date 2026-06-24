extends CharacterBody2D


var direction = 1
var SPEED = 300.0
const JUMP_VELOCITY = -500.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hud: CanvasLayer = $"../Hud"

#variaveis 
var pulos = 0
var puloGeral = 0

var isMooving = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("reiniciar"):
		GameManager.moedas = 0
		GameManager.pulos = 0
		GameManager.tentativas = 0
		get_tree().reload_current_scene()
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and pulos<3:
		velocity.y = JUMP_VELOCITY
		GameManager.pulos += 1
		hud.atualizar_pulos()
		puloGeral += 1
	# Get the input direction and handle the movement/deceleration.
	if(isMooving):
		direction = Input.get_axis("left", "right")
	
	# Inverte o sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	# Altera a animação
	if is_on_floor():	
		pulos = 0
		if(direction != 0):
			animated_sprite_2d.play("walk")
		else:
			animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func die():
	get_tree().reload_current_scene()
