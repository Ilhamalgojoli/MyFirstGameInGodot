extends Control

@onready var slider_sfx = $"VBoxContainer/HSlider2(SFX)"
@onready var slider_music = $"VBoxContainer/HSlider(Music)"

var bus_music_index: int 
var bus_sfx_index: int

func _ready() -> void:
	
	bus_music_index = AudioServer.get_bus_index("Music")
	bus_sfx_index = AudioServer.get_bus_index("Sfx")
	
	slider_music.value = linear_to_db(bus_music_index)
	slider_music.value_changed.connect(_on_h_slider_music_value_changed)
	
	slider_sfx.value = linear_to_db(bus_sfx_index)
	slider_music.value_changed.connect(_on_h_slider_sfx_value_changed)
	
func _on_h_slider_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_music_index,
		linear_to_db(value)
	)

func _on_h_slider_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_sfx_index,
		linear_to_db(value)
	)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://General_scene/MainMenu.tscn")
