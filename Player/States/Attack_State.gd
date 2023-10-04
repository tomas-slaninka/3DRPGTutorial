extends State
class_name AttackState


var player

func _ready():
	player = get_parent()
	jumpAnim()
	player.velocity.x = 0
	player.velocity.z = 0
	
func jumpAnim():
	animation.travel("Attack(1h)")

func _physics_process(delta):
	player.get_node("AnimationTree").advance(delta * 0.5)

func exit():
	pass
