extends Panel

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0
var ItemType = ""
var hasItem = false
var mouseEntered = false

@onready var itemInfo = preload("res://item_info.tscn")

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
			var itemInfoTmp = itemInfo.instantiate()
			add_child(itemInfoTmp)	
			itemInfoTmp.get_node("Anim").play("TransIn")

func _on_mouse_entered():
	if hasItem == true:
		mouseEntered = true


func _on_mouse_exited():
	mouseEntered = false
