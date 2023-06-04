extends "res://Entities/Character.gd"

var has_sword = false

func move_character():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	set_direction()
	
	
func set_animation():
	if not direction.x and not direction.y:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	else:
		if has_sword:
			$AnimatedSprite.play("sword_" + facing)
			
		else:
			$AnimatedSprite.play("run_" + facing)
