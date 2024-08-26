extends Line2D

var queue : Array
@export var max_length : int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = $"../".global_position
	width = ($"../shape".rad * 2 )+ 15
	queue.push_front(pos)
	if pos.y > 720 + 128 * 10 or pos.y < -128 * 10:
		queue.clear()
	if queue.size() > max_length:
		queue.pop_back()
	clear_points()
	for point in queue:
			add_point(point)
