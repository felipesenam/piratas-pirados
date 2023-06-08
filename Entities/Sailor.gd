extends "res://Entities/Enemy.gd"

func _ready():
	randomize()
	options = $Locations.get_children()
	choose_destination()


func choose_destination():
	if options:
		if status == 0:
			target_path = options[randi() % options.size()]
		elif status == 1:
			target_path = player
		
		$NavigationAgent2D.set_target_location(target_path.position)

func move_character():
	if $NavigationAgent2D.is_navigation_finished() and status == 0:
		if $Timers/MovementTimer.is_stopped():
			$Timers/MovementTimer.start()
			set_physics_process(false)
	else:
		run()
		
func run():
	var target = $NavigationAgent2D.get_next_location()
	
	direction = position.direction_to(target)
	set_direction()
	
	if is_on_wall():
		choose_destination()


func _on_MovementTimer_timeout():
	choose_destination()
	set_physics_process(true)



