extends Node
# contains all varibles evrything needs lmao
var version = "0.0.1-dev"
var fps = 69

func _process(delta):
	fps = int(delta * 10000)
