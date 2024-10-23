extends Node3D  # This script should be attached to a parent node like the XR Origin or Controller

var laser_right_active = false
var laser_left_active = false

func _ready():
	# This function runs when the scene starts
	var right_laser = $RightController/MeshInstance3D  # Reference to the right controller's laser node
	var left_laser = $LeftController/MeshInstance3D   # Reference to the left controller's laser node

func _input(event):
	# Toggle the right laser with "A" button
	if event.is_action_pressed("toggle_right_laser"):
		laser_right_active = !laser_right_active
		toggle_laser_sword($RightController/MeshInstance3D, laser_right_active)

	# Toggle the left laser with "X" button
	if event.is_action_pressed("toggle_left_laser"):
		laser_left_active = !laser_left_active
		toggle_laser_sword($LeftController/MeshInstance3D, laser_left_active)

# Function to toggle laser visibility and collision shape
func toggle_laser_sword(laser_sword_node, is_active):
	laser_sword_node.visible = is_active  # Toggle visibility of the laser
	
	# Enable or disable the collision shape
	var collision_shape = laser_sword_node.get_node("CollisionShape3D")
	if collision_shape:
		collision_shape.disabled = !is_active  # Disable collision when the laser is off
