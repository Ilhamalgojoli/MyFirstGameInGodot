extends TouchScreenButton

func _ready() -> void:
	visible = false
	Controller.connect("pick_up", _on_pick_up_triggered)
	
func _on_pick_up_triggered(trigger: bool) -> void:
	visible = true

func _on_pressed() -> void:
	get_tree().change_scene_to_file("")
