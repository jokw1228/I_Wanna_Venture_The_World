extends PathFollow2D

export(PackedScene) var SnailDead

export (float) var speed = 50
onready var SnailSprite = $SnailSprite

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta):
	offset += speed * delta

func _on_Detector_body_entered(body: Node) -> void:
	if body is Player and SnailSprite.animation == "stop":
		set_physics_process(true)
		SnailSprite.play("move")

func _on_Detector_area_entered(area: Area2D) -> void:
	if area is SnailKiller:
		area.die()
		die()

func die():
	var inst = SnailDead.instance()
	inst.position = position
	inst.rotation = rotation
	get_parent().add_child(inst)
	
	queue_free()
