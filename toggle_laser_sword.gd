extends Node3D  
var laser_right_active = false
var laser_left_active = false

# Declare variables to store references to the laser swords
var right_laser
var left_laser

func _ready():
	# This function runs when the scene starts
	print("Script is running")
	set_process_input(true)
	
	# Store references to the right and left laser swords
	right_laser = $RightController/MeshInstance3D
	left_laser = $LeftController/MeshInstance3D

func _input(event):
	# Toggle right laser with "A" button
	if event.is_action_pressed("toggle_right_laser"):
		print("Right laser toggle detected!")
		laser_right_active = !laser_right_active
		toggle_laser_sword(right_laser, laser_right_active)
	
	# Toggle left laser with "X" button
	if event.is_action_pressed("toggle_left_laser"):
		print("Left laser toggle detected!")
		laser_left_active = !laser_left_active
		toggle_laser_sword(left_laser, laser_left_active)

# Function to toggle laser visibility and collision shape
func toggle_laser_sword(laser_sword_node, is_active):
	# Toggle visibility
	laser_sword_node.visible = is_active

	# Access the Area3D node and then the CollisionShape3D
	var area = laser_sword_node.get_node("Area3D")
	var collision_shape = area.get_node("CollisionShape3D")
	if collision_shape:
		collision_shape.disabled = !is_active  # Enable/disable collision
