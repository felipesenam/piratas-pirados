extends "res://Entities/Character.gd"

var status = 0
onready var player = get_node("/root").find_node("Player", true, false)

var target_path
var options

func set_animation():
	if not direction.x and not direction.y:
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play("run_" + facing)

func _on_FOV_body_entered(body):
	if body.collision_layer == 1:
		status = 1
		$NavigationAgent2D.set_target_location(body.position)
		set_physics_process(true)

func _on_FOV_body_exited(body):
	if body.collision_layer == 1:
		status = 0
		$NavigationAgent2D.set_target_location(body.position)
		set_physics_process(true)

func _on_AttackArea_body_entered(body):
	if body.collision_layer == 1:
		set_physics_process(false)
		$AnimationPlayer.play("attack_" + facing)

func attack():
	player.receive_attack(damage, facing)
	$Timers/MovementTimer.start(1)

func after_attack():
	status = 1
	$NavigationAgent2D.set_target_location(player.position)
	set_physics_process(false)
	$Timers/BattleTimer.start(1)

func _on_BattleTimer_timeout():
	set_physics_process(true)
