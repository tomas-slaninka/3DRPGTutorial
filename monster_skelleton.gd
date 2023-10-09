extends CharacterBody3D

var health = 10
const SPEED = 2.0

var chasePlayer = false
var attackPlayer = false

@onready var mesh = get_node("KayKit_AnimatedCharacter_v1_2")
@onready var anim = get_node("KayKit_AnimatedCharacter_v1_2/AnimationPlayer")
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var direction

func _physics_process(delta):
	if health <= 0:
		anim.play("Defeat")
		await anim.animation_finished

	direction = Vector3.ZERO
	if not is_on_floor():
		velocity.y -= gravity * delta
	var player = get_node("../../Characters/Player")
	if player:
		direction = (player.position - position).normalized()

	if chasePlayer:
		if direction:
			mesh.rotation.y = lerp(mesh.rotation.y, 
				atan2(direction.x, direction.z) - rotation.y, delta * 10)
			anim.play("Run")
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	elif attackPlayer:
		if direction:
			mesh.rotation.y = lerp(mesh.rotation.y, 
				atan2(direction.x, direction.z) - rotation.y, delta * 10)
		anim.play("Attack(1h)")
		velocity.x = 0 
		velocity.z = 0
	else:
		velocity.x = 0 
		velocity.z = 0
	move_and_slide()

func _on_attack_player_body_entered(body):
	if body.is_in_group("Player"):
		attackPlayer = true
		chasePlayer = false


func _on_chase_player_body_entered(body):
	if body.is_in_group("Player"):
		print("chase")
		chasePlayer = true


func _on_attack_player_body_exited(body):
	if body.is_in_group("Player"):
		attackPlayer = false
		chasePlayer = true


func _on_chase_player_body_exited(body):
	if body.is_in_group("Player"):
		chasePlayer = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Defeat":
		queue_free()


func _on_weapon_slot_right_body_entered(body):
	pass # Replace with function body.
