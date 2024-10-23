extends Node3D

var cube_scene : PackedScene  # A reference to the cube scene to be spawned
var spawn_interval : float = 0  # Time between spawns
var spawn_timer : float = 0  # Timer to track spawning time

func _ready():
	randomize()
	cube_scene = preload("res://cubescene.tscn") 
	spawn_interval = randf_range(0.5, 1.5)

func _process(delta):
	# Update the spawn timer
	spawn_timer += delta
	# Check if it's time to spawn a new cube
	if spawn_timer >= spawn_interval:
		
		_spawn_cube()  # Call function to spawn the cube
		spawn_timer = 0  # Reset the timer
		# Set a new random interval for the next cube spawn
		spawn_interval = randf_range(0.5, 2.0)

#
func _spawn_cube():
	if not cube_scene:
		print("Error: cube_scene is not loaded or is invalid!")
		return
	var new_cube = cube_scene.instantiate()
	var random_pos = Vector3(0,0,-5)
	add_child(new_cube)
