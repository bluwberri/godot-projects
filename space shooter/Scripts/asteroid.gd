extends Sprite2D
@export var asteroid1 : Texture
@export var asteroid2 : Texture
@export var comet1 : Texture
@export var comet2 : Texture
@onready var collision = $"../shape"
var asteroids = {1 : asteroid1, 2 : asteroid2}
var comets = {1 : comet1, 2 : comet2}
var selected_obstacle

# Called when the node enters the scene tree for the first time.
func _ready():
	change_obstacle(collision)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector2(0,0)
	rotation_degrees += 300 * delta
	
func change_obstacle(shape):
	selected_obstacle = randi_range(1,2)
	if selected_obstacle == 1:
		if randi_range(1,2) == 1:
			texture = asteroid1
		else:
			texture = asteroid2
	else:
		if randi_range(1,2) == 1:
			texture = comet1
		else:
			texture = comet2
	shape.recalibrate(self)
