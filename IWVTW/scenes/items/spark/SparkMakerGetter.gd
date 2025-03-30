extends Area2D

export(PackedScene) var SparkMaker
export(int) var count = 1
export(float) var set_scale = 1

func _ready() -> void:
	$CenterContainer/TextPS2P_item.text = str(count)

func _on_SparkMakerGetter_body_entered(body: Node) -> void:
	if body is Player:
		var inst = SparkMaker.instance()
		inst.count = count
		inst.set_scale = set_scale
		body.add_child(inst)
		queue_free()
