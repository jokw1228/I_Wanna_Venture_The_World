extends Node2D

export(PackedScene) var go_to_scene

func _process(_delta):
	if Input.is_action_just_pressed("key_z"):
		get_tree().change_scene_to(go_to_scene)
