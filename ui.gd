extends CanvasLayer

@onready var anim = get_node("Anim")

func _on_close_pressed():
	anim.play("TransOut")
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
func _input(event):
	if $Inventory.position.y == 64 and event.is_action_pressed("Inv"):
		_on_close_pressed()
	elif $Inventory.position.y == 650 and event.is_action_pressed("Inv"):
		anim.play("TransIn")
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
		$Inventory/InvContainer.fillInventorySlots()

