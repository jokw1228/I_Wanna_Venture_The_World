extends Area2D
export(PackedScene) var scene

func _on_Warp_body_entered(body):
	if body is Player:
		get_tree().change_scene_to(scene)
