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

func receive_attack(damage, facing):
	health -= damage
	print("Damage! ",damage, " ",health)
	if health <= 0:
		$AnimationPlayer.play("die")
		set_physics_process(false)
	
	apply_knockback(facing)
	after_attack()

func apply_knockback(facing):
	print(facing)
	if facing == "up":
		position.y -= knockback
	elif facing == "down":
		position.y += knockback
	elif facing == "left":
		position.x -= knockback
	elif facing == "right":
		position.x += knockback

func after_attack():
	pass

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
