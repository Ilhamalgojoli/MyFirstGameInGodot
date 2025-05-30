extends Node2D

var animate_scroll: AnimatedSprite2D
var area: Area2D
var answered := false

func _ready() -> void:
	animate_scroll = $AnimatedSprite2D
	area = $Area2D
	animate_scroll.visible = true 
	area.body_entered.connect(_on_area_2d_body_entered)
	area.body_exited.connect(_on_area_2d_body_exited)
	add_to_group("scrolls")

func _on_area_2d_body_entered(body: Node) -> void:
	if body.name == "Player" and self.visible:
		Controller.active_scroll_node = self
		animate_scroll.play("Scroll")
		Controller.emit_signal("interect", true, false, false)

func _on_area_2d_body_exited(body: Node) -> void:
	if body.name == "Player":
		animate_scroll.play("Scroll", -1.0, true)
		Controller.emit_signal("interect", false, false, false)
		if answered:
			hide_scroll()

func hide_scroll():
	await get_tree().create_timer(1.5).timeout
	visible = false
