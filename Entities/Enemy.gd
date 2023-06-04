extends "res://Entities/Character.gd"

var status = 0

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
		# set_physics_process(true)
