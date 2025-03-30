extends Sprite

export(PackedScene) var Spark
export(PackedScene) var SparkMakerTrash
var count
var set_scale

func _ready() -> void:
	set_label()
	$SparkRange.scale = Vector2(set_scale, set_scale)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("key_x"):
		count -= 1
		var inst = Spark.instance()
		inst.position = global_position
		inst.scale = Vector2(set_scale, set_scale)
		get_parent().get_parent().add_child(inst)
		if count == 0:
			destroyed()
		set_label()

func destroyed():
	var inst = SparkMakerTrash.instance()
	inst.position = global_position
	get_parent().get_parent().add_child(inst)
	queue_free()

func set_label():
	$CenterContainer/TextPS2P_item.text = str(count)
