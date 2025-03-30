extends Area2D


func _on_Killer_body_entered(body):
	if body is Player:
		#pass
		body.die()
