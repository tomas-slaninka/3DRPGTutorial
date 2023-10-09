extends Area3D


func _process(delta):
	hideAll()
	match Inv.equip["RightHand"]["Name"]:
		"Sword":
			$sword_broken.show()
		"Staff":
			$sword_broken_half.show()
		_:
			pass

func hideAll():
	$sword_broken.hide()
	#$sword_broken_half.hide()

func _on_body_entered(body):
	print("entered")
	if body.is_in_group("Monster"):
		print("attacked")
		body.health -= 5
