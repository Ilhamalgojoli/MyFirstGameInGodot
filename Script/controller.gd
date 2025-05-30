extends Node

var coin: int = 0
var level_press := 0
var answer_quiz := false
var show_all_complete := false
var level_unlock = [true, false, false]
var result: int = 0
signal my_coin(coin: int)
signal interect(trigger: bool, is_exit: bool, controller: bool)
signal show_dialog(show: bool)
signal show_controller(show_contoller: bool)
signal show_pause_dialog(show: bool)
signal show_exit_dialog(show: bool)
signal show_button(show: bool)

func count_coin() -> void:
	coin += 1
	check_percentage()
	emit_signal("my_coin", coin)

func show_quiz(show: bool):
	return emit_signal("show_dialog", show)

func show_pause(show: bool):
	return emit_signal("show_pause_dialog", show)

func show_exit(show: bool):
	return emit_signal("show_exit_dialog", show)

var active_scroll_node = null

var levels = [
	"res://Game_scene/level_1.tscn",
	"res://Game_scene/level_2.tscn",
	"res://Game_scene/level_3.tscn"
]

var level_coin = [ 46, 51, 41 ]
var level_index = 0

func replay_scene():
	var current_scene = get_tree().current_scene
	var scene_path = current_scene.scene_file_path
	get_tree().change_scene_to_file(scene_path)

func _handle_next_level():
	if level_index < level_unlock.size():
		level_unlock[level_index + 1] = true

func go_to_next_level():
	level_index += 1
	
	if level_index < levels.size():
		_handle_next_level()
		get_tree().change_scene_to_file(levels[level_index])
	else:
		show_all_complete = true
		await handle_all_complete()

func handle_all_complete():
	await get_tree().create_timer(3.0).timeout
	level_index = 0
	show_all_complete = false
	get_tree().change_scene_to_file(levels[level_index])

func update_current_level_index():
	var current_path = get_tree().current_scene.scene_file_path
	level_index = levels.find(current_path)

func check_percentage():
	var max_coin = level_coin[level_index]
	if max_coin > 0:
		result = (coin * 100.0 / max_coin)
	else:
		result = 0

func check_all_scroll_answered() -> bool:
	for scroll in get_tree().get_nodes_in_group("scrolls"):
		if not scroll.answered:
			return false
	return true
