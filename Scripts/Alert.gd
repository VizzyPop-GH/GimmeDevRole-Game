extends Node2D

var timer = 0
var timeOnDaScreen = 0
var input = 0
var timing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeOnDaScreen = input / delta
	if timing:
		timer += 1
		if timer >= timeOnDaScreen:
			timer = 0
			timing = false
			$Animator.play("NotifyOut")

func notify(text : String, desc : String, timeOnScreen : int):
	$root/Panel/scaler/error.text = text
	$root/Panel/scaler/desc.text = desc
	$Animator.play("NotifyIn")
	$sound.play()
	input = timeOnScreen

func _on_animator_finished(anim_name):
	if anim_name == "NotifyIn":
		timing = true
