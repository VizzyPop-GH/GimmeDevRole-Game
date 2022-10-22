extends Node2D

@onready var fps = get_node("scaler/fps")
@onready var mem = get_node("scaler/mem")
@onready var ver = get_node("scaler/ver")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$scaler/fps.text = str(int(delta * 10000)) + "fps"
