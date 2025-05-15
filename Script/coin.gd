extends Label

func _ready() -> void:
	Controller.connect("my_coin", get_coin)

func get_coin(coin: int) -> void:
	text = "Coin : " + str(coin)
