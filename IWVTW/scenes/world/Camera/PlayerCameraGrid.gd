extends Camera2D

func _process(_delta):
	# Update view position
	for player in get_tree().get_nodes_in_group("Player"):
		position = Vector2(floor(player.position.x / 1024) * 1024, floor(player.position.y / 576) * 576)
