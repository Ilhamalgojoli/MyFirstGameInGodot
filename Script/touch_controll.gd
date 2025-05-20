extends CanvasLayer

@onready var left = $left
@onready var right = $right
@onready var jump = $jump
@onready var interect = $Interect
@onready var exit_button = $ExitButton

func _ready() -> void:
	interect.visible = false
	exit_button.visible = false
	Controller.connect("interect", _on_interect_triggered)
	
func _on_interect_triggered(trigger: bool, is_exit: bool, is_controller: bool) -> void:
	if is_exit:
		exit_button.visible = trigger
		interect.visible = false
	elif is_controller:
		left.visible = trigger
		right.visible = trigger
		jump.visible = trigger
		exit_button.visible = false
		interect.visible = false
	else:
		interect.visible = trigger
		exit_button.visible = false

func _on_exit_button_pressed() -> void:
	if Controller.answer_quiz:
		get_tree().change_scene_to_file("res://General_scene/ChooseLevel.tscn")

func _on_interect_pressed() -> void:
	Controller.level_press += 1
	if Controller.level_press > 3:
		Controller.level_press = 1
	Controller.show_quiz(true)
