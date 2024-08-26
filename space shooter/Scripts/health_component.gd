class_name HealthComponent extends Node2D
@export var max_health : float
@export var health : float
@export var lives : int
signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		if get_parent() is CharacterBody2D:
			death.emit()
		
func restore():
	health = max_health
	
func damage():
	health -= 1
