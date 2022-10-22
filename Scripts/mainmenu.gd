extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fps_counter_no_build_num():
	$notifier.notify("Unable to get build number", "Unknown\n Could be an issue with your internet", 1)
