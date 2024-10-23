extends CSGBox3D

var move_speed = 5.0
var target_position = Vector3(0, 0, 0)

func _ready():
	
	self.size = Vector3(0.5, 0.5, 0.5)  
	var random_pos = Vector3(randf_range(0,2),randf_range(0,2),-10)
	
	
	self.transform.origin = random_pos
	
	var material = StandardMaterial3D.new()
	
	
	if randi() % 2 == 0:
		material.albedo_color = Color(1, 0, 0)  
	else:
		material.albedo_color = Color(0, 0, 1) 
	
	
	self.material_override = material


func _process(delta):
	
	var direction = (target_position - self.transform.origin).normalized()
	self.transform.origin += direction * move_speed * delta
	
	
	if self.transform.origin.distance_to(target_position) < 0.1:
		
		queue_free()

func _on_hit_by_laser():
	
	queue_free()
