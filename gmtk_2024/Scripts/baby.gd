extends Node2D

@export var road : Node2D
@onready var sprite = $Sprite


@export var BatterySubtraction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if road == null:
		road = $"../Roads"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (road):
		position.x -= delta * road.velocity / get_parent().scale.x


func _on_area_2d_body_entered(body):
	if (body.name == "PlayerCar" && sprite.frame == 0):
		print("OH NO")
		road.slowDown()
		sprite.frame = 1
		$"../Battery Control".batteryWrongHit(BatterySubtraction)
		$"../ScreenShaker".shake(16, 0.01, 12)
		$"../Detrement".flash()
