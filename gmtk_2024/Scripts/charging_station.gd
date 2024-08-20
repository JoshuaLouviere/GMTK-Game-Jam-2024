extends Node2D

var charging = false
@export var rate = 20
@onready var battery_control = $"../Battery Control/ProgressBar"
@export var road : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if road == null:
		road = $"../Roads"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (road):
		position.x -= delta * road.velocity / get_parent().scale.x
	if (charging):
		battery_control.value += delta * (road.velocity / rate) #* 0.75


func _on_area_2d_body_entered(body):
	if (body.name == "PlayerCar"):
		charging = true


func _on_charger_body_exited(body):
	if (body.name == "PlayerCar"):
		charging = false
