extends ColorRect

var aMax = 155.0
var alpha = 0.0
var col = "#ff0044"
var rateNorm = 20
var rate = rateNorm
var accel = 49

func flash():
	alpha = aMax
	rate = rateNorm


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if alpha > 0:
		rate += accel * delta
		alpha -= delta * rate
	
	color = Color(col + ("%02x" % alpha))
