extends Control

var count = 0
@export var goal = 1
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (count >= goal):
		$"../ObjSpawner".active = false
		$"../Roads".won = true
		$"../Transition".go = true
		$"../Transition".scene = "res://Scenes/win_scene.tscn"
		print("you won")
	label.text = "%03d/%d" % [count, goal]
