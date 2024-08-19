extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_game_button_pressed() -> void:
	$Transition.go = true
	$Transition.scene = "res://Scenes/joshua_test_scene.tscn"
	pass # Replace with function body.
