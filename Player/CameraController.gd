extends Node3D

@export var sensitivity = 5
@onready var springArm: SpringArm3D = get_node("SpringArm3D")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _process(delta):
	# Force camera to always follow the Player
	global_position = $"..".global_position


func _input(event):
	# Camera rotation based on the mouse input
	if event is InputEventMouseMotion:
		var xRotation = clamp(rotation.x + event.relative.y / 1000 * sensitivity, -0.25, 0.25)
		var yRotation = rotation.y - event.relative.x / 1000 * sensitivity
		rotation = Vector3(xRotation, yRotation, 0)

	# Zoom in and out
	if event is InputEventMouseButton:
		if event.button_index == 5:
			if springArm.spring_length < 10:
				springArm.spring_length += 0.1
		
		if event.button_index == 4:
			if springArm.spring_length > 2:
				springArm.spring_length -= 0.1
