extends Area2D

signal clicked
signal changed

export(bool) var _switch = true
var switch = true
export(Texture) var on
export(Texture) var off

func _ready() -> void:
	if _switch == false:
		change_switch()

func change_switch():
	emit_signal("changed")
	if switch == true:
		switch = false
		$Ball.texture = off
		$Spark.visible = false
	else:
		switch = true
		$Ball.texture = on
		$Spark.visible = true


func _on_PowerSupply_area_entered(area: Area2D) -> void:
	if area is Spark:
		emit_signal("clicked")
		change_switch()
