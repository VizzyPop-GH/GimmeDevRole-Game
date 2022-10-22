extends Node


@export var introTextDisplay : Array
@export var timeInbetweenHitsInSeconds:float = 3
@export var textIndex = 0
var counter = 0
var counterThingy:float = 0.0
var otherCounter = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$scaler/text.text = introTextDisplay[otherCounter]
	
	if textIndex==0:
		pass
	elif textIndex==1:
		$scaler.translate(Vector2(0,100))
	elif textIndex==2:
		$scaler.translate(Vector2(0,200))
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	counter += 1
	counterThingy = timeInbetweenHitsInSeconds/delta
	if counter==counterThingy:
		if otherCounter==introTextDisplay.size()-1:
			$AnimationPlayer.play("IntroOut")
			
		else:
			counter = 0
			$AnimationPlayer.play("IntroHit")
			otherCounter += 1
			$scaler/text.text = introTextDisplay[otherCounter]
		
			


func _on_animation_finished(anim_name):
	if anim_name== "IntroOut":
		$scaler/text.visible = false
