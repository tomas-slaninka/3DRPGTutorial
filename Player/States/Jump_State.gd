extends State
class_name JumpState

var player

func _ready():
	player = get_parent()
	jumpAnim()
	
func jumpAnim():
	animation.travel("Jump")

func  _physics_process(delta):
	await get_tree().create_timer(0.4).timeout
	player.velocity.y = move_toward(player.velocity.y, player.JUMP_VELOCITY, player.JUMP_VELOCITY/50)

	if player.is_on_floor():
		player.change_state("idle")

func exit():
	pass
