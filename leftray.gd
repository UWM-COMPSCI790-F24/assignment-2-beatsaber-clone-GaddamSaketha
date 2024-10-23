extends RayCast3D
var is_hit_by_ray1 = false
func _ready():
	is_hit_by_ray1 = false  # Reset flag when the cube is created

func _process(delta):
	
	if self.is_colliding():
		var collider = self.get_collider()
		if collider.name == "CSGBox3D":  
			var material = collider.material_override
			
			var color = material.albedo_color
			if color == Color(1, 0, 0, 1):
				is_hit_by_ray1 = true
				if is_hit_by_ray1 == true:
					var sound_player=$"../../../../AudioStreamPlayer3D"
					sound_player.play()
				collider.queue_free() 
				
