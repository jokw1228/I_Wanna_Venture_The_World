extends Area2D


func _on_MoreJump_body_entered(body):
	if $Sprite.visible == true:
		$Sprite.visible = false
		$Timer.start(3)
		body.djump = 1


func _on_Timer_timeout():
	$Sprite.visible = true
