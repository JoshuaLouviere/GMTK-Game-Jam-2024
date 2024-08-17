extends Node2D

@onready var spawn_here = $SpawnHere
const GRANDMA_FILL = preload("res://Scenes/grandma_fill.tscn")

func spawnGranny():
	var obj = GRANDMA_FILL.instantiate()
	add_child(obj)
	obj.position = spawn_here.position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
