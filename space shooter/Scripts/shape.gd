extends CollisionShape2D
@onready var visual = $"../visual"
var rad = shape.radius
# Called when the node enters the scene tree for the first time.
func _ready():
	recalibrate(visual)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rad = shape.radius
	position = Vector2(0,0)
	
func recalibrate(visual):
	if visual.selected_obstacle == 1:
		shape.radius = 64
	else:
		shape.radius = 12
