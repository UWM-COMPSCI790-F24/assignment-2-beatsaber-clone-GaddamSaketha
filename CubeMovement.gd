extends MeshInstance3D

var move_speed = 2.0  # Speed at which the cube moves towards the player
var target_position = Vector3(0, 0, 0)  # User's start position (the origin)

func _ready():
	# Adjust the size of the cube
	self.scale = Vector3(0.5, 0.5, 0.5)  # Adjust this to the desired cube size

	# Set the initial position of the cube (starting at z = -10)
	self.transform.origin = Vector3(0, 0, -2)
	print("Initial cube position: ", self.transform.origin)
	
	

func _process(delta):
	# Move the cube towards the target position (origin)
	var direction = (target_position - self.transform.origin).normalized()
	self.transform.origin += direction * move_speed * delta

	# Debugging output to check the position during movement
	print("Cube current position: ", self.transform.origin)
	
	
	# If the cube reaches the target, reset or destroy it
	if self.transform.origin.distance_to(target_position) < 0.1:
		print("Cube reached the target, destroying...")
		queue_free()  # Destroy the cube once it reaches the player
