extends Node2D

var flashTime = 1
var switchtime = 0.2
var fTimer = flashTime
var sTimer = 0
enum Modes { Grandma, Baby }
var mode : Modes

@onready var grandma_sprite = $GrandmaSprite
@onready var baby_sprite = $BabySprite

func flash(m = Modes.Grandma):
	fTimer = flashTime
	mode = m

func _ready():
	grandma_sprite.visible = false
	baby_sprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (fTimer > 0):
		fTimer -= delta
		
		sTimer -= delta
		if (sTimer <= 0):
			match (mode):
				Modes.Grandma:
					grandma_sprite.visible = !grandma_sprite.visible
				Modes.Baby:
					baby_sprite.visible = !baby_sprite.visible
			sTimer = switchtime
	else:
		grandma_sprite.visible = false
		baby_sprite.visible = false
