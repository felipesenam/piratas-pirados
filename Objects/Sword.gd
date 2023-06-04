extends "res://Objects/Collectable.gd"

export var damage = 3

func update_data(body):
	body.damage = damage
	body.has_sword = true
