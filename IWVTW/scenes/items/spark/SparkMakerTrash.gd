extends Sprite

var velocity = Vector2(rand_range(-400,400),rand_range(-400,-300))
var dir = rand_range(-9*PI, 9*PI)

func _process(delta: float) -> void:
	velocity.y += 15
	position += velocity * delta
	rotate(dir*delta)
