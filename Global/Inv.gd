extends Node

var items = {
	0 : {
		"Name": "Staff",
		"Desc": "This is a Staff",
		"Cost": "100",
		"Type": "Weapon",
		"Icon": preload("res://icon.svg"),
	},
	1 : {
		"Name": "Green Arrow",
		"Desc": "This is a Green Arrow",
		"Cost": "10",
		"Type": "Misc",
		"Icon": preload("res://icon.svg")
	},
	2 : {
		"Name": "Sword",
		"Desc": "This is a Sword",
		"Cost": "70",
		"Type": "Weapon",
		"Icon": preload("res://icon.svg")
	}
}

var inventory = {
	
}

func _ready():
	addItem("Sword")

func addItem(itemName):
	var hasItem = false
	for i in inventory:
		if inventory[i]["Name"] == itemName:
			inventory[i]["Count"] += 1
			hasItem = true
	if hasItem == false:
		for i in items:
			if items[i]["Name"] == itemName:
				var tempDic = items[i]
				tempDic["Count"] = 1
				inventory[inventory.size()] = tempDic
			
