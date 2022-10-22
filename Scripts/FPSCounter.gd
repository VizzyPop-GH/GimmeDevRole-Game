extends Node2D
signal noBuildNum
@onready var fps = get_node("thej/scaler/fps")
@onready var mem = get_node("thej/scaler/mem")
@onready var gh = get_node("thej/scaler/Github")
@onready var ver = get_node("thej/scaler/ver")
@onready var main = get_node("thej/main")
var gotBuildNum = true
var buildNum = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	GetBuildNumber()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateFps(delta)
	updateMem()
	
	

func updateFps(delta):
	fps.text = str(int(delta * 10000)) + "fps"
	main.fps = int(delta * 10000)
	
func updateMem():
	var memory = OS.get_static_memory_usage()
	var parsedMem = parseMem(memory)
	mem.text = parsedMem
	
func parseMem(mem):
	var mydick = int(mem)
	var RETURN = "sussy balls"
	if mydick >= 1000000:
		mydick = mydick / 1000000
		RETURN = str(mydick) + "mb"
	else:
		RETURN = str(mydick) + "b"
	if mydick >= 125 && mydick >= 1000000 / 1000000:
		mydick = mydick / 125
		RETURN = str(mydick) + "gb"

	return(RETURN) 
	
func GetBuildNumber():
	$thej/Github.request("https://api.github.com/repos/VizzyPop-GH/GimmeDevRole-Game/contributors")

func _on_github_request_completed(result, response_code, headers, body):

	var thej = body.get_string_from_utf8().replace("\\", "") # we dont like these
	thej = thej.replace("[", "") # we dont like these
	thej = thej.replace("]", "") # we dont like these
	var jsonParser = JSON.new() # create json parser
	var error = jsonParser.parse(thej) # parse the stuff github sends us back
	var parsed = jsonParser.get_data() # get the parsed data
	if thej.contains("contributions"):
		buildNum = parsed.contributions # grab the commit number
		ver.text = main.version + " (b" + str(buildNum) + ")" # shove it on da text
		
	else:
		print("WARN: Unable to get build number")
		buildNum = "Quota Reached"
		gotBuildNum = false
		ver.text = main.version # shove it on da text
		emit_signal("noBuildNum")
		
	

