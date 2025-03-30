extends Particles2D

func _ready():
	$AudioDie.play()

func _on_Timer_timeout() -> void:
	emitting = false
