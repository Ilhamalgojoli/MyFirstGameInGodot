extends Label

func _ready() -> void:
	Controller.coin = 0
	Controller.connect("my_coin", get_coin)
	get_coin(Controller.coin)

func get_coin(coin: int) -> void:
	text = "Coin : " + str(coin)
