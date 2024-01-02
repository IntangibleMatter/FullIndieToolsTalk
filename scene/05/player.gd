@tool
extends CharacterBody2D

const FRICTION = 0.4
const TOP_SPEED = 300.0
const ACCELERATION = 700.0
const JUMP_VELOCITY = -450.0

@export_enum("left", "right") var facing := "right":
	set(val):
		facing = val
		sprite.flip_h = facing == "left"
	

@onready var sprite: Sprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	sprite.flip_h = facing == "left"
	if Engine.is_editor_hint():
		set_physics_process(false)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x += direction * ACCELERATION * delta
	else:
		velocity.x = lerp(velocity.x, 0.0, FRICTION)
	
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	velocity.x = clamp(velocity.x, -TOP_SPEED, TOP_SPEED)

	move_and_slide()
