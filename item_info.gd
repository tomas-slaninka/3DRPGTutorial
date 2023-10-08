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
	var itemEquipped = false
	for i in Inv.inventory:
		if Inv.inventory[i]["Name"] == ItemName:
			var path = "../Equip/" + str(Inv.inventory[i]["Type"])
			if has_node(path):
				if get_node(path).hasItem == true:
					Inv.addItem(Inv.equip[ItemType]["Name"])
				get_node(path).hasItem = true
				Inv.equip[Inv.inventory[i]["Type"]] = Inv.inventory[i]
				_on_close_pressed()
			else:
				# Misc item handling
				print("Misc")
			
			#itemEquipped = false
			#if $Use.text == "Equip":
			#	path = "../Equip/" + str(Inv.inventory[i]["Type"])
			#	if get_node(path).hasItem == true:
			#		if  get_node(path).get_node("Icon").texture == get_node("Icon").texture:#
			#			itemEquipped = tru#e
			#
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
	if itemEquipped == true:
		Inv.addItem(Inv.equip[ItemType]["Name"])
	get_node("../InvContainer").fillInventorySlots()
	_on_close_pressed()


func _on_unequip_pressed():
	Inv.addItem(ItemName)
	get_node("../InvContainer").fillInventorySlots()
	_on_close_pressed()
	var path = "../Equip/" + str(ItemType)
	get_node(path).hasItem = false
	Inv.equip[ItemType] = {
		"Name": "",
		"Des" : "",
		"Cost": 10,
		"Type": "RightHand",
		"Icon": preload("res://icon.svg"),
		"Count": 1
	}
