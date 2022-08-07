extends KinematicBody

var gravity = -30
var max_speed = 6

var mouse_sensitivity = 20
var min_look_angle = -30
var max_look_angle = 20
var mouse_delta = Vector2()
onready var pivot = get_node("Pivot")

var velocity = Vector3()

var time_from_on_floor : float
var coyote_time = 0.25

var jump = 10
var rotate = 1 #deg per frame

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func get_input():
	var input_dir = Vector3()
	var camera_transform = $Pivot/Camera.get_global_transform()
	
	# more relitive to camera
	if Input.is_action_pressed("forward"):
		input_dir += -camera_transform.basis.z
	if Input.is_action_pressed("backward"):
		input_dir += camera_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -camera_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += camera_transform.basis.x
	
	#normalise to limit speeed to 1
	input_dir = input_dir.normalized()
	
	if input_dir.length() > 0.2:
		#Point towards the direction they are moving
		var look_direction = Vector2(input_dir.z, input_dir.x)
		$Armature.rotation.y = look_direction.angle()
		
		#Play walk animation if the player are walking
		$Armature/AnimationPlayer.play("Run")
	else:
		#Play the idle animation if the player isn't moving
		$Armature/AnimationPlayer.play("Idle")
	
	return input_dir

func _input(event):
	if event is InputEventMouseMotion and Input.is_action_pressed("rclick"):
		mouse_delta = event.relative

func _process(delta):
	var rot = Vector3(mouse_delta.y, mouse_delta.x, 0) * mouse_sensitivity * delta
	
	pivot.rotation_degrees.x += rot.x
	pivot.rotation_degrees.x = clamp(pivot.rotation_degrees.x, min_look_angle, max_look_angle)
	
	pivot.rotation_degrees.y += rot.y
	
	mouse_delta = Vector2()

func _physics_process(delta):
	if self.is_on_floor():
		time_from_on_floor = 0
	else: 
		time_from_on_floor += 1*delta
	
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	
	if Input.is_action_just_pressed("jump"):
		if time_from_on_floor <= coyote_time:
			velocity.y = jump
	velocity = move_and_slide(velocity, Vector3.UP, true)
