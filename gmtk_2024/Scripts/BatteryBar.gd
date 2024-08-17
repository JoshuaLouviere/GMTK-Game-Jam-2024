extends Control

@export var rate = 0.01

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
	

func _on_timer_timeout() -> void:
	$ProgressBar.value -= rate
	

func batteryWrongHit(batterydebt):
	#if baby and car collided hit 
		$ProgressBar.value -= batterydebt 
