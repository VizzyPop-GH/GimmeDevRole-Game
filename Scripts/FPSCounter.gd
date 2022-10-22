extends CanvasLayer

@onready var fps = get_node("scaler/fps")
@onready var mem = get_node("scaler/mem")
@onready var ver = get_node("scaler/ver")
@onready var main = get_node("main")
var buildNum = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	GetBuildNumber()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$scaler/fps.text = str(int(delta * 10000)) + "fps"
	


func GetBuildNumber():
	$Github.request("https://api.github.com/repos/VizzyPop-GH/GimmeDevRole-Game/contributors")

func _on_github_request_completed(result, response_code, headers, body):

	var thej = body.get_string_from_utf8().replace("\\", "")
	thej = thej.replace("[", "")
	thej = thej.replace("]", "") # get rid of that damn shit
	var jsonParser = JSON.new()
	var error = jsonParser.parse(thej)
	var parsed = jsonParser.get_data()
	buildNum = parsed.contributions
	ver.text = main.version + " (b" + str(buildNum) + ")"
