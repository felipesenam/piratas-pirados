extends Area2D


func _on_Collectable_body_entered(body):
	if body.collision_layer == 1:
		update_data(body)
		queue_free()

func update_data(body):
	pass
