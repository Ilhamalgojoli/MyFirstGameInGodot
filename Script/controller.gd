extends Node

var coin: int = 0
var level_press := 0
var exit_show:= false
signal my_coin(coin: int)
signal interect(trigger: bool, is_exit: bool, controller: bool)
signal show_dialog(show: bool)
signal show_controller(show_contoller: bool)
signal disappire_scroll

func count_coin() -> void:
	coin += 1
	emit_signal("my_coin", coin)

func show_quiz(show: bool):
	return emit_signal("show_dialog", show)

func disappire():
	return emit_signal("disappire_scroll")

var questions: Array = [
	["Apa ibu kota Indonesia?", "Bandung", "Jakarta", "Surabaya", 1],
	["Siapa penemu lampu pijar?", "Albert Einstein", "Thomas Edison", "Isaac Newton", 1],
	["Berapakah hasil dari 12 x 3?", "36", "30", "42", 0],
	["Planet terbesar di tata surya adalah?", "Bumi", "Jupiter", "Saturnus", 1],
	["Organ tubuh yang berfungsi memompa darah adalah?", "Hati", "Paru-paru", "Jantung", 2],
	["Siapa proklamator kemerdekaan Indonesia?", "Sukarno & Hatta", "Sukarno & Soedirman", "Hatta & Sjahrir", 0],
	["Gunung tertinggi di Indonesia adalah?", "Gunung Semeru", "Gunung Rinjani", "Puncak Jaya", 2],
	["Bahasa resmi negara Jepang adalah?", "Mandarin", "Jepang", "Korea", 1],
	["Hewan pemakan daging disebut?", "Omnivora", "Herbivora", "Karnivora", 2],
	["Jika sebuah persegi memiliki keliling 36 cm, berapa panjang sisinya?", "6 cm", "9 cm", "12 cm", 1],
	["Doni membeli 3 buku seharga masing-masing Rp12.000 dan 2 pensil seharga Rp3.500. Berapa total uang yang harus dibayar Doni?", "Rp36.000", "Rp42.000", "Rp43.000", 2]
]
