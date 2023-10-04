extends GridContainer


@onready var slot = preload("res://slot.tscn")
var invSize = 24

func _ready():	
	for i in invSize:
		var slotTemp = slot.instantiate()
		add_child(slotTemp)
	fillInventorySlots()

func fillInventorySlots():
	for i in Inv.inventory:
		get_child(i).ItemName = Inv.inventory[i]["Name"]
		get_child(i).ItemDes = Inv.inventory[i]["Desc"]
		get_child(i).ItemCost = Inv.inventory[i]["Cost"]
		get_child(i).ItemCount = Inv.inventory[i]["Count"]
		get_child(i).ItemType = Inv.inventory[i]["Type"]
		get_child(i).hasItem = true
		get_child(i).get_child(0).texture = Inv.inventory[i]["Icon"]
