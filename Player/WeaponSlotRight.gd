extends Area3D


func _on_body_entered(body):
	print("entered")
	if body.is_in_group("Monster"):
		print("attacked")
		body.health -= 5
