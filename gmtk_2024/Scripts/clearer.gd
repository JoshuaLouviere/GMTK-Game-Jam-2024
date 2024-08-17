extends Area2D

func _on_area_entered(area):
	if (area.name == "Granny" || area.name == "Baby" || area.name == "Charger"):
		area.get_parent().queue_free()
