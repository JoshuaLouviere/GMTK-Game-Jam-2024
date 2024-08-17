extends Node2D

var timer = 2
@export var time = 2.0
var babyChance = 30
var active = true

@onready var positions = $Positions.get_children()
const GRANDMA = preload("res://Scenes/grandma.tscn")
const BABY = preload("res://Scenes/baby.tscn")
var rng = RandomNumberGenerator.new()

func spawnGranny(pos):
	var obj = GRANDMA.instantiate()
	add_sibling(obj)
	obj.position = positions[pos].position
	positions[pos].get_child(0).flash(0)

func spawnBaby(pos):
	var obj = BABY.instantiate()
	add_sibling(obj)
	obj.position = positions[pos].position
	positions[pos].get_child(0).flash(1)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (active):
		timer -= delta
		
		if timer <= 0:
			var pos = rng.randi_range(0, positions.size()-1)
			var chance = rng.randf() * 100
			if (chance <= babyChance):
				spawnBaby(pos)
			else:
				spawnGranny(pos)

			timer = time
