extends Node2D

@export var road : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if road == null:
		road = $"../Roads"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (road):
		position.x -= delta * road.velocity
