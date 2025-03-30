extends Sprite

var velocity = Vector2(rand_range(-200,200),rand_range(-500,-200))
var dir = rand_range(-18*PI, 18*PI)

func _process(delta: float) -> void:
	velocity.y += 15
	position += velocity * delta
	rotate(dir*delta)
