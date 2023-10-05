extends CanvasLayer

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0
var ItemType = ""

func updateInfo():
	if ItemType == "Misc":
		$Use.text = "Use"
	else:
		$Use.text = "Equip"
	get_node("Title").text = ItemName
	get_node("Description").text = ItemDes + "\nCost: " + str(ItemCost)


func _on_close_pressed():
	pass # Replace with function body.


func _on_use_pressed():
	pass # Replace with function body.
