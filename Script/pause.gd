extends Node2D

@onready var pause_dialog = $CanvasLayer

func _ready() -> void:
	pause_dialog.visible = false
	Controller.connect("show_pause_dialog", _on_show_pause)

func _on_show_pause(show: bool):
	if show:
		pause_dialog.visible = true
		Controller.emit_signal("interect", false, false, true)

func _on_resume_pressed() -> void:
	pause_dialog.visible = false
	Controller.emit_signal("interect", true, false, true)

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://General_scene/ChooseLevel.tscn")
