extends CenterContainer

export(PackedScene) var go_to_scene
export(PackedScene) var room_option

var presskey_pressed = 0
var select = 1

func _ready():
	pass

func _process(_delta):
	if presskey_pressed == 0:
		if Input.is_action_just_pressed("key_z"):
			presskey_pressed = 1
			$presskey.visible = false
			for i in range(2,4):
				menu_return(i).add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
			$SelectVBoxContainer.visible = true
			$SelectPressed.play()
	elif presskey_pressed == 1:
		var select_difference = 0
		
		if Input.is_action_just_pressed("key_up"):
			select_difference -= 1
		if Input.is_action_just_pressed("key_down"):
			select_difference += 1
		
		if select_difference != 0:
			
			var select_new = select
			select_new += select_difference
			if select_new < 1:
				select_new = 3
			elif select_new > 3:
				select_new = 1
			
			menu_return(select_new).add_color_override("font_color", Color(1, 1, 1, 1))
			menu_return(select).add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
			$Select.play()
			
			select = select_new
		
		if Input.is_action_just_pressed("key_z"):
			presskey_pressed = 2
			$SelectPressed.play()
			$DelayTimer.start(1)
			

func menu_return(_select):
	if _select == 1:
		return $SelectVBoxContainer/start
	elif _select == 2:
		return $SelectVBoxContainer/option
	elif _select == 3:
		return $SelectVBoxContainer/exit

func _on_DelayTimer_timeout() -> void:
	if select == 1:
		Director.load_game()
	elif select == 2:
		get_tree().change_scene_to(room_option)
	elif select == 3:
		get_tree().quit()
