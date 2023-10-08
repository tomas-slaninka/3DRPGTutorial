extends Node


var hasItem = false
var mouseEntered = false

@onready var itemInfo = $"../../ItemInfo"

func _process(delta):
	if hasItem == true:
		$Icon.show()
		$Icon.texture = Inv.equip[str((self.name))]["Icon"]
	else:
		$Icon.hide()

func _input(event):
	if event.is_action_pressed("LeftClick"):
		if mouseEntered:
			itemInfo.get_node("Use").hide()
			itemInfo.get_node("Unequip").show()
			itemInfo.offset.x = get_viewport().get_mouse_position().x
			itemInfo.offset.y = get_viewport().get_mouse_position().y
			itemInfo.ItemName = Inv.equip[str((self.name))]["Name"]
			itemInfo.ItemDes = Inv.equip[str((self.name))]["Desc"]
			itemInfo.ItemCost = Inv.equip[str((self.name))]["Cost"]
			itemInfo.ItemCount = Inv.equip[str((self.name))]["Count"]
			itemInfo.ItemType = Inv.equip[str((self.name))]["Type"]
			itemInfo.get_node("Icon").texture = Inv.equip[str((self.name))]["Icon"]
			get_node("../../").process_mode = Node.PROCESS_MODE_DISABLED
			

func _on_mouse_entered():
	if hasItem == true:
		mouseEntered = true

func _on_mouse_exited():
	mouseEntered = false
