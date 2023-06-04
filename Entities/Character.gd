extends KinematicBody2D

export var speed: int
export var health: int
export var damage: int
export var knockback: int

var direction = Vector2(0, 0)
var facing

func _physics_process(delta):
	move_character()
	set_animation()
	move_and_slide(direction * speed)

func move_character():
	pass

func set_animation():
	pass

func set_direction():
	if direction.x > 0 and abs(direction.x) > abs(direction.y):
		facing = "right"
	elif direction.x < 0 and abs(direction.x) > abs(direction.y):
		facing = "left"
	elif direction.y < 0 and abs(direction.x) < abs(direction.y):
		facing = "up"
	elif direction.y > 0 and abs(direction.x) < abs(direction.y):
		facing = "down"
