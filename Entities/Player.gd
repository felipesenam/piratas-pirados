extends "res://Entities/Character.gd"

var has_sword = false
export var max_hp : int

func move_character():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	
	set_direction()

func _process(delta):
	update_hud()

func update_hud():
	get_tree().call_group("HUD", "update_health", health)

func _input(event):
	if Input.is_action_just_pressed("attack") and has_sword:
		set_physics_process(false)
		$AnimationPlayer.play("attack_" + facing)

func set_animation():
	if not direction.x and not direction.y:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	else:
		if has_sword:
			$AnimatedSprite.play("sword_" + facing)
			
		else:
			$AnimatedSprite.play("run_" + facing)

func die():
	get_tree().quit()

func _on_AttackArea_body_entered(body):
	if body.collision_layer == 8:
		body.receive_attack(damage, facing)


func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
