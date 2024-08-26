extends Area2D
var spawn : Vector2
@onready var visual = $visual
@onready var collision = $shape

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn = Vector2(randi_range(64,360-64),-128)
	global_position = spawn


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += (900 * delta)
	if global_position.y > 720 + 128:
		spawn = Vector2(randi_range(64,360-64),-128)
		global_position = spawn
		visual.change_obstacle(collision)
