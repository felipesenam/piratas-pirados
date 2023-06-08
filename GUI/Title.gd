extends Control

func _ready():
	$AnimationPlayer.play("title")

func _on_Start_pressed():
	get_tree().change_scene("res://Levels/Fase01.tscn")


func _on_Exit_pressed():
	get_tree().quit()
