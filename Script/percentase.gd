extends Node2D

@onready var complete_all_level = $All_level_complete
@onready var result = $CanvasLayer/Result
@onready var percentage = $CanvasLayer
@onready var level = $CanvasLayer/Level

func _ready() -> void:
	percentage.visible = false
	if Controller.show_all_complete:
		complete_all_level.visible = true
	Controller.connect("show_exit_dialog", _on_show)
	level.text = "Level " + str(Controller.level_index + 1)

func _on_show(show: bool):
	if show:
		percentage.visible = true
		_on_result_game()
		Controller.emit_signal("interect", false, false, true)

func _on_result_game():
	result.text = str(Controller.result) + " %"

func _on_restart_pressed() -> void:
	Controller.replay_scene()

func _on_play_again_pressed() -> void:
	Controller.go_to_next_level()

func _on_exit_pressed() -> void:
	Controller._handle_next_level()
	get_tree().change_scene_to_file("res://General_scene/ChooseLevel.tscn")
