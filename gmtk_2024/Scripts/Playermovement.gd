extends CharacterBody2D

@onready var LaneOnePos = $"../LaneOne".position
@onready var LaneTwoPos = $"../LaneTwo".position
@onready var LaneThreePos = $"../LaneThree".position
@onready var LaneFourPos = $"../LaneFour".position

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_up"):
		
		match position:
			LaneOnePos:
				print("car is in the top lane")
			LaneTwoPos:
				#position  -=  (position - LaneOnePos) * delta
				position = LaneOnePos
			LaneThreePos:
				position  = LaneTwoPos
			LaneFourPos:
				position  = LaneThreePos
		
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_down"):
		match position:
			LaneOnePos:
				position  = LaneTwoPos
			LaneTwoPos:
				position  = LaneThreePos
			LaneThreePos:
				position  = LaneFourPos
			LaneFourPos:
				print("car is in the bottom lane")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
