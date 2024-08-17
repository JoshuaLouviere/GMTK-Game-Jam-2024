extends ProgressBar

@export var road : Node2D

func _ready():
	max_value = road.terminalVelocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = road.velocity
