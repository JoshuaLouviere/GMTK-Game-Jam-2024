extends Node2D

@onready var grannySounds = get_node("GrandmaHits").get_children()
var rng = RandomNumberGenerator.new()

func grandmaHit():
	var i = rng.randi_range(0, grannySounds.size() - 1)
	grannySounds[i].play()
