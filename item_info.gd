extends CanvasLayer

@onready var anim = get_node("Anim")
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
	get_node("../").process_mode = Node.PROCESS_MODE_ALWAYS
	anim.play("TransOff")


func _on_use_pressed():
	for i in Inv.inventory:
		if Inv.inventory[i]["Name"] == ItemName:
			ItemCount -= 1
			if ItemCount == 0:
				var tempDict = {}
				for x in Inv.inventory:
					if x > i:
						tempDict[x-1] = Inv.inventory[x]
					elif x < i:
						tempDict[x] = Inv.inventory[x]
				Inv.inventory.clear()
				Inv.inventory = tempDict
				_on_close_pressed()
			else:
				Inv.inventory[i]["Count"] = ItemCount
	get_node("../InvContainer").fillInventorySlots()
