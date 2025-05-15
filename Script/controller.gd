extends Node

var coin: int = 0
var level_press := 0
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
	["Berapakah hasil dari 12 x 3?", "36", "30", "42", 0]
]
