extends Node
var played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func flash():
	$AnimationPlayer.play("FLASH")


func _on_animation_player_animation_finished(anim_name):
	remove_child($ColorRect)
	played = true
