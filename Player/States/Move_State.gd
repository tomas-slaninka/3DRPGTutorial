extends State
class_name MoveState

var player

func _ready():
	player = get_parent()
	animation.travel("Walk")

func _physics_process(delta):
	if player.direction:
		player.player_mesh.rotation.y = lerp_angle(player.player_mesh.rotation.y, atan2(player.direction.x, player.direction.z) - player.rotation.y, delta * 10)
		
		player.velocity.x = player.direction.x * player.SPEED
		player.velocity.z = player.direction.z * player.SPEED
	else:
		player.change_state("idle")
	
	if Input.is_action_just_pressed("Jump") and player.is_on_floor():
		player.change_state("jump")
	if Input.is_action_just_pressed("Attack") and player.is_on_floor():
		player.change_state("attack")

func exit():
	print("Exit state Move")
