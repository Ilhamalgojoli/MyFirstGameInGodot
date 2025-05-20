extends Node2D

var animate_scroll = AnimatedSprite2D
var area: Area2D

func _ready() -> void:
	animate_scroll = $AnimatedSprite2D
	area = $Area2D
	area.body_entered.connect(_on_area_2d_body_entered)
	area.body_exited.connect(_on_area_2d_body_exited)
	Controller.connect("disappire_scroll", Callable(self, "delete_scroll"))

func _on_area_2d_body_entered(body: Node) -> void:
	if body.name == "Player":
		animate_scroll.play("Scroll")
		Controller.emit_signal("interect", true, false, false)

func _on_area_2d_body_exited(body: Node) -> void:
	if body.name == "Player":
		animate_scroll.play("Scroll", -1.0, true)
		Controller.emit_signal("interect", false, false, false)
		
