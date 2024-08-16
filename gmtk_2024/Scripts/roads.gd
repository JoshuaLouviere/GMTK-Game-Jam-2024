extends Node2D

@onready var road = get_children()
@export var velocity = 300
@export var terminalVelocity = 900
@export var acceleration = 50
@export var debugging = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (debugging):
		if (Input.is_action_pressed("ui_accept")):
			velocity += delta * 89
		elif velocity > 0:
			velocity -= delta * 89
		
		if (velocity <= 0):
			velocity = 0
	elif velocity <= terminalVelocity:
		velocity += acceleration * delta
	
	for i in get_children():
		i.global_position.x -= velocity * delta
		
		if i.global_position.x <= -i.get_child(0).texture.get_width():
			i.position.x += i.get_child(0).texture.get_width() * (get_children().size() - 1) / 2 * i.scale.x
