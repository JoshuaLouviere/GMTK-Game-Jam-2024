extends ColorRect

var alpha = 255.0
var col = "#1b1b2c"

var rate = 170.0
var active = false
var go = false
var scene = ""

var maxes = 255.0

# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_parent().name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (alpha > 0 && active == false):
		alpha -= delta * rate
		
		if (alpha <= 0):
			alpha = 0
		
		color = Color(col + "%02x" % alpha)
	else:
		active = true
	
	if (alpha < maxes && go):
		alpha += delta * rate
		var a = alpha
		if (alpha >= 255):
			a = 255
		
		color = Color(col + "%02x" % a)
		
	elif (go):
		get_tree().change_scene_to_file(scene)
	
	
	


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
	pass # Replace with function body.
