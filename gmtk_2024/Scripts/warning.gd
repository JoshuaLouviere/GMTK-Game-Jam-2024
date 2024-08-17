extends Node2D

var flashTime = 0.6
var switchtime = 0.1
var fTimer = 0
var sTimer = 0
enum Modes { Grandma, Baby, Charge }
var mode : Modes

@onready var grandma_sprite = $GrandmaSprite
@onready var baby_sprite = $BabySprite
@onready var charge_sprite = $ChargeSprite

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
				Modes.Charge:
					charge_sprite.visible = !charge_sprite.visible
			sTimer = switchtime
	else:
		grandma_sprite.visible = false
		baby_sprite.visible = false
		charge_sprite.visible = false
