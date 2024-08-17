extends Node2D

@onready var road = get_children()
@export var velocity = 300
@export var terminalVelocity = 900
@export var acceleration = 50
@export var debugging = true
@onready var obj_spawner = $"../ObjSpawner"
@onready var battery_control = $"../Battery Control".get_child(0)

var lose = false
var sTimer = 0
var sTime = 0.2
var reduceSpeed = 350

func slowDown():
	sTimer = sTime
	if (velocity >= reduceSpeed):
		velocity -= reduceSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (debugging):
		if (Input.is_action_pressed("ui_accept")):
			velocity += delta * 89
		elif velocity > 0:
			velocity -= delta * 89
			
	elif velocity <= terminalVelocity && lose == false:
		sTimer -= delta
		obj_spawner.active = true
		if (sTimer > 0):
			velocity -= acceleration * delta
		else:
			velocity += acceleration * delta
	elif lose && velocity > 0:
		velocity -= delta * 550
		obj_spawner.active = false
	
	if (battery_control.value <= 0):
		lose = true
	
	if (velocity <= 0):
		velocity = 0
	
	for i in get_children():
		i.global_position.x -= velocity * delta
		
		if i.global_position.x <= -i.get_child(0).texture.get_width():
			i.position.x += i.get_child(0).texture.get_width() * (get_children().size() - 1) / 2 * i.scale.x
