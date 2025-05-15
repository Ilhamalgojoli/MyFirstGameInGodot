extends CharacterBody2D

const SPEED = 500.0
const GRAVITY = 1000.0
const WEIGHT_PLAYER = 1.5
const JUMP_VELOCITY = -1500.0

var animation_player: AnimatedSprite2D

func _ready():
	animation_player = $AnimatedSprite2D
	up_direction = Vector2.UP

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta * WEIGHT_PLAYER
		animation_player.play("Jump")

	# Manual jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Smooth jump 
	if velocity.y > 0 || velocity.y < 0:
		velocity.y += GRAVITY * delta * WEIGHT_PLAYER 

	# Movement
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = direction * SPEED

	if direction != 0:
		animation_player.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animation
	if is_on_floor():
		if direction != 0:
			animation_player.play("Run")
		else:
			animation_player.play("Idle")
	else:
		animation_player.stop()

	move_and_slide()
