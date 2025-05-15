extends Node2D

@onready var quiz_dialog = $Quiz
@onready var question_label = $Quiz/Pertanyaan
@onready var answer_a = $"Quiz/VBoxContainer/Jawaban 1"
@onready var answer_b = $"Quiz/VBoxContainer/Jawaban 2"
@onready var answer_c = $"Quiz/VBoxContainer2/Jawaban 3"
@onready var result_label = $Quiz/Jawaban

var correct_index = 0

func _ready():
	quiz_dialog.visible = false
	Controller.connect("show_dialog", _on_show_dialog)

func _on_show_dialog(show: bool) -> void:
	if show:
		show_question(Controller.level_press - 1)

func show_question(index):
	var q = Controller.questions[index]
	question_label.text = q[0]
	answer_a.text = q[1]
	answer_b.text = q[2]
	answer_c.text = q[3]
	correct_index = q[4]
	result_label.text = ""
	quiz_dialog.visible = true
	Controller.emit_signal("interect", false, false, true)

func _on_answer_pressed(index):
	if index == correct_index:
		Controller.count_coin()
		result_label.text = "Benar! +1 Coin"
		Controller.disappire()
		Controller.emit_signal("interect", true, false, true)
	else:
		result_label.text = "Salah! Coba lagi"
	await get_tree().create_timer(1.5).timeout
	quiz_dialog.visible = false

func _on_jawaban_1_pressed() -> void:
	_on_answer_pressed(0)
func _on_jawaban_2_pressed() -> void:
	_on_answer_pressed(1)
func _on_jawaban_3_pressed() -> void:
	_on_answer_pressed(2)

func _on_exit_scene_pressed() -> void:
	quiz_dialog.visible = false
	Controller.emit_signal("interect", true, false, true)
