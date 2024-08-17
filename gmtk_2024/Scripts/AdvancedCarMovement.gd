extends CharacterBody2D

@onready var lane_one = $"../LaneOne".position
@onready var lane_two = $"../LaneTwo".position
@onready var lane_three = $"../LaneThree".position
@onready var lane_four = $"../LaneFour".position
@onready var icon = $Icon

var pos = 0
var speed = 15
@onready var lanes = [ lane_one, lane_two, lane_three, lane_four ]

func _physics_process(delta):
	
	var direction =  int(Input.is_action_just_pressed("ui_down")) - int(Input.is_action_just_pressed("ui_up"))
	if (direction):
		print(direction)
	
	if ((direction > 0 && pos < lanes.size() - 1) || (direction < 0 && pos > 0)) :
		pos += direction
	
	#var lookPos = lanes[pos] + Vector2(500, 0)
	#var dir = lookPos.direction_to(position)
	#icon.rotation -= (icon.rotation - dir.angle()) * delta * speed
	
	position -= (position - lanes[pos]) * delta * speed
	move_and_slide()
