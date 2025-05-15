extends TouchScreenButton

func _ready() -> void:
	visible = false
	Controller.connect("interect", _on_pick_up_triggered)
	
func _on_pick_up_triggered(trigger: bool) -> void:
	visible = trigger

func _on_pressed() -> void:
	Controller.level_press += 1
	if Controller.level_press > 3:
		Controller.level_press = 1
	Controller.show_quiz(true)
