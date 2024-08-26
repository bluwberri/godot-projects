extends Node2D
var scrolling = 100
@onready var parallax = $ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().paused != true:
		parallax.scroll_base_offset.y += scrolling * delta
		scrolling += 10 * delta
	if get_tree().paused != true:
		if Input.is_action_just_pressed("pause"):
			get_tree().paused = true
	elif get_tree().paused == true:
		if Input.is_action_just_pressed("pause"):
			get_tree().paused = false
	
