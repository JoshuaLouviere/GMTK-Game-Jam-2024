extends Sprite2D

@export var rotateSpeed = 20
@export var rotateAccel = 20

@export var growSpeed = 0.1

@export var velocity = 10

@onready var jar = $"../Jar"
@onready var fly_to = $"../Jar/FlyTo"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotateSpeed += delta * rotateAccel
	rotation += delta * deg_to_rad(rotateSpeed)
	
	if (scale.x < 1.3):
		scale += Vector2(1,1) * growSpeed * delta
	
	position -= (position - fly_to.global_position) * delta * velocity
	
	if (position.distance_to(fly_to.global_position) < 10):
		jar.spawnGranny()
		queue_free()
	
