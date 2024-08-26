extends CharacterBody2D

var direction
var spawn = Vector2(182,588)
const SPEED = 400.0
@export var healthcomponent : HealthComponent
@onready var visual = $visual
var hurt = false
var stop_score = false

func _ready():
	visual.play("default")
		
func _process(delta):
	if direction:
		rotation_degrees = 45 * direction.x
	else:
		rotation_degrees = 0

func _physics_process(delta):
	if !hurt:
		direction = Input.get_vector("left", "right", "up", "down")
		if direction:
			velocity = direction * SPEED
		else:
			velocity = Vector2(0,0)
		velocity = Vector2(move_toward(velocity.x,0,40),move_toward(velocity.y,0,40))

	move_and_slide()
	global_position.y = clamp(position.y, 470,720 - 128/4)
	global_position.x = wrapf(position.x, 0 + (128/2)/4,360 - (128/2)/4)
		

func _on_health_component_death():
	stop_score = true


func _on_hitbox_area_entered(area):
	if !hurt:
		hurt = true
		healthcomponent.damage()
		visual.play("hurt")
		visual.modulate = Color(1,0,0,1)
		velocity = (global_position - area.position).normalized() * 400
		await get_tree().create_timer(0.5).timeout
		visual.play("default")
		visual.modulate = Color(1,1,1,1)
		hurt = false
