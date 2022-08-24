extends StaticBody2D

func _on_Area2D_area_entered(area):
	if area.is_in_group("Door"):
		print("pal")
		area.queue_free()
		self.queue_free()
