extends Area2D

var can_interate = false

func _on_Area2D_body_entered(body):
	if body.collision_layer == 1:
		can_interate = true


func _on_Area2D_body_exited(body):
	if body.collision_layer == 1:
		can_interate = false

func _input(event):
	if Input.is_action_just_pressed("interact") and can_interate:
		if $"..".rotation_degrees == 0:
			$"../AnimationPlayer".play("horizontal_vertical")
		
		else:
			$"../AnimationPlayer".play("vertical_horizontal")
		
		$"../../Light2D".enabled = true
