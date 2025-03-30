extends RayCast2D

var switch = true

func _ready():
	$fill.points[0] = Vector2(0, 0)
	$outline.points[0] = Vector2(0, 0)
	
func _physics_process(_delta):
	if switch == true:
		cast_to = Vector2(0, 10000)
		if is_colliding():
			$fill.points[1] = to_local(get_collision_point())
			$outline.points[1] = to_local(get_collision_point())
		#else:
			#$fill.points[1] = cast_to
			#$outline.points[1] = cast_to

func change_switch():
	if switch == true:
		switch = false
		cast_to = Vector2(0, 0)
		$fill.points[1] = cast_to
		$outline.points[1] = cast_to
		$StaticBody2D/CollisionPolygon2D_door.set_deferred("disabled", false)
	else:
		switch = true
		$StaticBody2D/CollisionPolygon2D_door.set_deferred("disabled", true)
