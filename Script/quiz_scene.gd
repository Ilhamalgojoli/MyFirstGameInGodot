extends Node2D

@onready var quiz_dialog = $Quiz
@onready var question_label = $Quiz/Pertanyaan
@onready var answer_a = $"Quiz/VBoxContainer/Jawaban 1"
@onready var answer_b = $"Quiz/VBoxContainer/Jawaban 2"
@onready var answer_c = $"Quiz/VBoxContainer2/Jawaban 3"
@onready var result_label = $Quiz/Jawaban

var correct_index = 0
var index = 0

var questions_per_level = {
	"res://Game_scene/level_1.tscn": [
		{ "text": ["Apa ibu kota Indonesia?", "Bandung", "Jakarta", "Surabaya", 1] },
		{ "text": ["Siapa penemu lampu pijar?", "Albert Einstein", "Thomas Edison", "Isaac Newton", 1] },
		{ "text": ["Berapakah hasil dari 12 x 3?", "36", "30", "42", 0] }
	],
	"res://Game_scene/level_2.tscn": [
		{ "text": ["Planet terbesar di tata surya adalah?", "Bumi", "Jupiter", "Saturnus", 1] },
		{ "text": ["Organ tubuh yang berfungsi memompa darah adalah?", "Hati", "Paru-paru", "Jantung", 2] },
		{ "text": ["Siapa proklamator kemerdekaan Indonesia?", "Sukarno & Hatta", "Sukarno & Soedirman", "Hatta & Sjahrir", 0] }
	],
	"res://Game_scene/level_3.tscn": [
		{ "text": ["Hewan pemakan daging disebut?", "Omnivora", "Herbivora", "Karnivora", 2] },
		{ "text": ["Jika sebuah persegi memiliki keliling 36 cm, berapa panjang sisinya?", "6 cm", "9 cm", "12 cm", 1] },
		{ "text": ["Doni membeli 3 buku seharga masing-masing Rp12.000 dan 2 pensil seharga Rp3.500. Berapa total uang yang harus dibayar Doni?", "Rp36.000", "Rp42.000", "Rp43.000", 2] }
	]
}

func _ready():
	quiz_dialog.visible = false
	Controller.connect("show_dialog", _on_show_dialog)

func _on_show_dialog(show: bool) -> void:
	if show:
		show_question(index)

func show_question(index: int):
	Controller.answer_quiz = false

	var current_path = get_tree().current_scene.scene_file_path
	
	if not questions_per_level.has(current_path):
		print("Tidak ditemukan soal untuk level ini:", current_path)
		return

	var q_list = questions_per_level[current_path]

	if index >= q_list.size():
		Controller.show_text(true)
		return

	var q_data = q_list[index]
	var q = q_data["text"]

	question_label.text = q[0]
	answer_a.text = q[1]
	answer_b.text = q[2]
	answer_c.text = q[3]
	correct_index = q[4]

	result_label.text = ""
	quiz_dialog.visible = true
	Controller.emit_signal("interect", false, false, true)

func _on_answer_pressed(index):
	print("Answer pressed:", index)
	if index == correct_index:
		Controller.count_coin()
		result_label.text = "Benar! +1 Coin"
		Controller.level_press += 1 
		Controller.answer_quiz = true
		Controller.emit_signal("interect", true, false, true)
		
		self.index += 1
		
		if Controller.active_scroll_node:
			Controller.active_scroll_node.answered = true
	else:
		result_label.text = "Salah! Coba lagi"
		Controller.emit_signal("interect", true, false, true)
		return
	quiz_dialog.visible = false

func _on_jawaban_1_pressed() -> void:
	_on_answer_pressed(0)
func _on_jawaban_2_pressed() -> void:
	_on_answer_pressed(1)
func _on_jawaban_3_pressed() -> void:
	_on_answer_pressed(2)

func _on_exit_scene_pressed() -> void:
	quiz_dialog.visible = false
	Controller.answer_quiz = false
	Controller.emit_signal("interect", true, false, true)
