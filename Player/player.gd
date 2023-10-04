extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 300

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction

var state
var state_factory

@onready var AnimTree = get_node("AnimationTree")
@onready var playback = AnimTree.get("parameters/playback")
@onready var player_mesh = get_node("KayKit_AnimatedCharacter_v1_2")

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Get the direction where the camera is phasing
	var h_rot = $CameraController.transform.basis.get_euler().y
	
	# Get the input from the player
	direction = Vector3( 
		Input.get_action_strength("WalkLeft") - Input.get_action_strength("WalkRight"), 
		0, 
		Input.get_action_strength("WalkUp") - Input.get_action_strength("WalkDown") )


	direction = direction.rotated(Vector3.UP, h_rot).normalized()
	move_and_slide()
	
func change_state(new_state_name):
	# Remove the previous state
	if state != null:
		state.exit()
		state.queue_free()
	# Add a new state
	state = state_factory.get_state(new_state_name).new()
	state.setup("change_state", playback, self)
	state.name = new_state_name
	add_child(state)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Attack(1h)":
		change_state("idle")


func _on_weapon_slot_right_body_entered(body):
	pass # Replace with function body.
