extends Panel

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0
var ItemType = ""
var hasItem = false
var mouseEntered = false

@onready var itemInfo = $"../../ItemInfo"

func _process(delta):
	if hasItem == true:
		$Icon.show()
		$Count.show()
		$Count.text = str(ItemCount)
	else:
		$Icon.hide()
		$Count.hide()


func _input(event):
	if event.is_action_pressed("LeftClick"):
		if mouseEntered:
			# itemInfo.get_node("Anim").play("TransIn")
			itemInfo.offset.x = get_viewport().get_mouse_position().x
			itemInfo.offset.y = get_viewport().get_mouse_position().y
			itemInfo.ItemName = ItemName
			itemInfo.ItemDes = ItemDes
			itemInfo.ItemCost = ItemCost
			itemInfo.ItemCount = ItemCount
			itemInfo.ItemType = ItemType
			itemInfo.get_node("Icon").texture = $Icon.texture
			get_node("../../").process_mode = Node.PROCESS_MODE_DISABLED
			itemInfo.updateInfo()

func _on_mouse_entered():
	if hasItem == true:
		mouseEntered = true


func _on_mouse_exited():
	mouseEntered = false
