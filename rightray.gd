extends RayCast3D
var is_hit_by_ray = false
func _ready():
	is_hit_by_ray = false  # Reset flag when the cube is created

	
func _process(delta):
	
	if is_colliding():
		var collider = get_collider()  
	
		if collider.name == "CSGBox3D": 
			var material = collider.material_override
			
			var color = material.albedo_color
			if color == Color(0, 0, 1, 1):
				is_hit_by_ray = true
				if is_hit_by_ray == true:
					var sound_player=$"../../../../AudioStreamPlayer3D"
					sound_player.play()
				collider.queue_free() 
				
		
		
