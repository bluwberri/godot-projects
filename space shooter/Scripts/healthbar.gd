extends ProgressBar
@onready var player = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = player.healthcomponent.health
	
