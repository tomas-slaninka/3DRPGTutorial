extends CanvasLayer

var currItem = 0
var select = 0

func _ready():
	switchItem(0)

func _on_next_pressed():
	switchItem(currItem+1)


func _on_prev_pressed():
	switchItem(currItem-1)


func _on_purchase_pressed():
	if Game.Gold >= int(Inv.items[currItem]["Cost"]):
		Inv.addItem(Inv.items[currItem]["Name"])
		_on_close_pressed()
		Game.Gold -= int(Inv.items[currItem]["Cost"])
		Utils.save_game()


func _on_close_pressed():
	get_tree().paused = false
	get_node("Anim").play("TransOut")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func switchItem(select):
	select = select % Inv.items.size()
	for i in range(Inv.items.size()):
		if select == i:
			currItem = select
			$Shop/ItemIcon.texture = Inv.items[currItem]["Icon"]
			$Shop/Title.text = Inv.items[currItem]["Name"]
			$Shop/Desc.text = Inv.items[currItem]["Desc"]
			$Shop/Desc.text += "\nCost: " + str(Inv.items[currItem]["Cost"])
