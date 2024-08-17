extends Control

var count = 0
@export var goal = 32
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "Grandma Count: %02d/%d %d" % [count, goal, $"../Roads".velocity]
