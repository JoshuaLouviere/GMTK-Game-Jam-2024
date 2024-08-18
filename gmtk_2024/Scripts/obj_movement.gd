extends Node2D

@export var road : Node2D
@onready var sprite = $Sprite
const NUMBER_PARTICLE = preload("res://Scenes/number_particle.tscn")
const GRANDMA_HIT = preload("res://Scenes/grandma_hit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if road == null:
		road = $"../Roads"

func spawnHit():
	var obj = GRANDMA_HIT.instantiate()
	add_sibling(obj)
	obj.position = position

func createParticle():
	var obj = NUMBER_PARTICLE.instantiate()
	add_sibling(obj)
	obj.emitting = true
	obj.z_index = 2000
	obj.global_position = $"../GrannyCount/ParticleSpot".global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (road):
		position.x -= delta * road.velocity / get_parent().scale.x

# grandma hit
func _on_area_2d_body_entered(body):
	if (body.name == "PlayerCar" && sprite.frame == 0):
		sprite.frame = 1
		$"../GrannyCount".count += 1
		createParticle()
		spawnHit()
		$"../ScreenShaker".shake(8, 0.01, 12)
		Sounds.grandmaHit()
