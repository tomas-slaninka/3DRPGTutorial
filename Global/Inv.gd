extends Node

var items = {
	0 : {
		"Name": "Staff",
		"Desc": "This is a Staff",
		"Cost": "100",
		"Type": "RightHand",
		"Icon": preload("res://staff.png"),
	},
	1 : {
		"Name": "Green Arrow",
		"Desc": "This is a Green Arrow",
		"Cost": "10",
		"Type": "Misc",
		"Icon": preload("res://arrow.png")
	},
	2 : {
		"Name": "Sword",
		"Desc": "This is a Sword",
		"Cost": "70",
		"Type": "RightHand",
		"Icon": preload("res://Sword.png")
	},
	3 : {
		"Name": "Bow",
		"Desc": "This is a Bow",
		"Cost": "10",
		"Type": "RightHand",
		"Icon": preload("res://bow.png")
	},
}

var inventory = {
	
}
var equip = {
	"Head" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Head",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	},
	"Chest" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Chest",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	},
	"Legs" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Legs",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	},
	"Feet" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Feet",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	},
	"LeftHand" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Weapon",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	},
	"RightHand" : {
		"Name": "",
		"Desc": "",
		"Cost": 0,
		"Type": "Weapon",
		"Icon": preload("res://icon.svg"),
		"Count": 0
	}
}

func _ready():
	pass

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
			
