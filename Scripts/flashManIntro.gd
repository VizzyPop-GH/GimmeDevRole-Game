extends Node2D

@onready var text = $funnyText
@onready var notifier = $notifier
@onready var Flash = $Flash

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if text.otherCounter==text.introTextDisplay.size()-1:
		Flash.flash()
		switchScene("mainmenu")

func switchScene(scene):
	get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")
	


func _on_fps_no_build_num():
	$notifier.notify("Unable to get build number", "Unknown\n Could be an issue with your internet", 1)
