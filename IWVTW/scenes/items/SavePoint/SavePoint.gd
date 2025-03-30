extends Area2D

func _on_SavePoint_body_entered(_body):
	if $Sprite.visible == true:
		$Sprite.visible = false
		$Timer.start(3)
		$AudioStreamPlayer2D.play()
		Director.save_game()

func _on_Timer_timeout():
	$Sprite.visible = true
