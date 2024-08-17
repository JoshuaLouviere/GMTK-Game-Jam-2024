extends Node2D

var timer = 2
@export var time = 2.0
var babyChance = 30
var active = true

var chargeTime = 15
var cTimer = chargeTime

@onready var positions = $Positions.get_children()
const GRANDMA = preload("res://Scenes/grandma.tscn")
const BABY = preload("res://Scenes/baby.tscn")
const CHARGING_STATION = preload("res://Scenes/charging_station.tscn")

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

func spawnCharger():
	var obj = CHARGING_STATION.instantiate()
	add_sibling(obj)
	obj.position = positions[3].position
	obj.position.x += 900
	positions[3].get_child(0).flash(2)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (active):
		cTimer -= delta
		
		if (cTimer <= 0):
			cTimer = chargeTime
			spawnCharger()
			return
		else:
			timer -= delta
			
			if timer <= 0:
				var pos = rng.randi_range(0, positions.size()-1)
				var pos1 = rng.randi_range(0, positions.size()-1)
				while (pos1 == pos):
					pos1 = rng.randi_range(0, positions.size()-1)
				var chance = rng.randf() * 100
				if (chance <= babyChance):
					spawnBaby(pos)
				else:
					spawnGranny(pos)
					spawnGranny(pos1)

				timer = time
