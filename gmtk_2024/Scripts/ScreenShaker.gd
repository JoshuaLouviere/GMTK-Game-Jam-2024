extends Node2D

var range : Vector2
var offset : Vector2
var origin : Vector2
var time = 0.1
var times = 8
var timer = 0.0
var speed = 10
@export var camera : Node2D
var rng = RandomNumberGenerator.new()
var reset = true

func shake(tmes = 8, tim = 0.1, spd = 10, rnge = Vector2(3, 10)):
	timer = tim
	time = tim
	times = tmes
	speed = spd
	range = rnge
	origin = camera.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timer > 0):
		timer -= delta
		camera.position -= ((camera.position - origin) + offset) * delta * speed
		reset = true
		
		if (timer <= 0 && times > 0):
			timer = time
			offset.x = rng.randf_range(range.x, range.y)
			offset.y = rng.randf_range(range.x, range.y)
			var chance = rng.randf() * 100
			var chance1 = rng.randf() * 100
			if (chance <= 50):
				offset.x *= -1
			if (chance1 <= 50):
				offset.y *= -1
			times -= 1
	elif (reset):
		if (camera.position.distance_to(origin) < 0.1 || camera.position.distance_to(origin) > range.y):
			reset = false
			return
		camera.position -= (camera.position - origin)
