extends Control

@onready var level_2: Button = $"HBoxContainer/Level 2"
@onready var level_3: Button = $"HBoxContainer/Level 3"

func _ready():
	_on_complete()

func _on_complete():
	level_2.visible = Controller.level_unlock[1]
	level_3.visible = Controller.level_unlock[2]

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://General_scene/MainMenu.tscn")

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Game_scene/level_1.tscn")

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Game_scene/level_2.tscn")

func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Game_scene/level_3.tscn")
