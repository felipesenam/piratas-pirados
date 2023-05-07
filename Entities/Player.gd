extends KinematicBody2D

var direction = Vector2(0, 0)
export var speed = 100
var facing


func _physics_process(delta):
	set_movement()
	get_animation()
	
	move_and_slide(direction * speed)
	

func set_movement():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	get_direction()
	
func get_direction():
	if direction.x > 0:
		facing = "right"
	elif direction.x < 0:
		facing = "left"
	elif direction.y > 0:
		facing = "down"
	elif direction.y < 0:
		facing = "up"
		
	
func get_animation():
	if not direction.x and not direction.y:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	else:
		$AnimatedSprite.play("run_" + facing)
