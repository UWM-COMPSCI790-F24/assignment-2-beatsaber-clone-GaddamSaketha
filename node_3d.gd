extends Node3D

var xr_interface: XRInterface
@export var cube_scene : PackedScene  
var spawn_interval : float = 0  
var spawn_timer : float = 0  

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("OpenXR interface found, but not initialized. Please ensure Oculus is set as OpenXR runtime.")

	
	
	randomize()

	spawn_interval = randf_range(0.5, 1.5)
	
func _process(delta):
	
	spawn_timer += delta

	if spawn_timer >= spawn_interval:
		
		_spawn_cube()  
		spawn_timer = 0  
		
		spawn_interval = randf_range(0.5, 2.0)
		
		
func _spawn_cube():
	if not cube_scene:
		print("Error: cube_scene is not loaded or is invalid!")
		return
	var new_cube = cube_scene.instantiate()
	
	add_child(new_cube)

func _on_left_controller_button_pressed(button_name: String) -> void:
	print("Left controller button pressed: ", button_name)
	if button_name == "ax_button":
		# Toggle visibility
		var laser_visible = $XROrigin3D/LeftController/MeshInstance3D.visible
		$XROrigin3D/LeftController/MeshInstance3D.visible = not laser_visible
	

func _on_right_controller_button_pressed(button_name: String) -> void:
	print("Right controller button pressed: ", button_name)
	if button_name == "ax_button":
		# Toggle visibility
		var laser_visible = $XROrigin3D/RightController/MeshInstance3D.visible
		$XROrigin3D/RightController/MeshInstance3D.visible = not laser_visible
	if button_name == "by_button":
		XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, true)
