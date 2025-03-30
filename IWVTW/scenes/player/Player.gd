class_name Player
extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP
const FLOOR_DETECT_DISTANCE = 20.0

export(PackedScene) var BloodEmitter
onready var PlayerSprite = $PlayerSprite
onready var AudioJump = $AudioJump
onready var AudioDJump = $AudioDJump

var run_speed = 150.0
var jump_speed = 425.0
var djump_speed = 350.0
var gravity = 1000.0
var djump = 0
var velocity = Vector2(0.0, 0.0)

#임시 코드 수정 바람
func _ready():
	if Director.load_on == 1:
		position = Director.save_player_position
		Director.load_on = 0

func _physics_process(_delta):
	velocity.y += gravity * _delta
	
	var direction = get_direction()

	var is_jump_interrupted = Input.is_action_just_released("key_z") and velocity.y < 0.0
	calculate_move_velocity(direction, is_jump_interrupted)

	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	velocity = move_and_slide_with_snap(velocity, snap_vector, FLOOR_NORMAL, true, 4, 0.9, false)

	if direction.x != 0:
		PlayerSprite.scale.x = direction.x
	
	PlayerSprite.play(get_new_animation())
	
	if is_on_floor():
		djump = 1

func get_direction():
	return Vector2(
		Input.get_action_strength("key_right") - Input.get_action_strength("key_left"),
		-Input.get_action_strength("key_z") if Input.is_action_just_pressed("key_z") else 0.0
	)

func calculate_move_velocity(
		_direction,
		_is_jump_interrupted
	):
	velocity.x = run_speed * _direction.x
	if _direction.y != 0.0:
		if is_on_floor():
			velocity.y = jump_speed * _direction.y
			AudioJump.play()
		elif djump == 1:
			djump = 0
			velocity.y = djump_speed * _direction.y
			AudioDJump.play()
	if _is_jump_interrupted:
		velocity.y *= 0.5

func get_new_animation():
	var animation_new = ""
	if is_on_floor():
		animation_new = "run" if abs(velocity.x) > 0 else "idle"
	else:
		animation_new = "fall" if velocity.y > 0 else "jump"
	return animation_new

func die():
	var inst = BloodEmitter.instance()
	inst.position = position
	get_parent().add_child(inst)
	
	queue_free()
