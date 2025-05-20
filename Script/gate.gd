extends Node2D

@onready var anim_play = $AnimatedSprite2D
var first_enter: bool = true
@onready var area2d: Area2D = $Area2D

func _ready() -> void:
	area2d.body_entered.connect(_on_area_2d_body_entered)
	area2d.body_exited.connect(_on_area_2d_body_exited)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Controller.emit_signal("interect", true, true, false)
		if first_enter:
			first_enter = false
		else:
			anim_play.play("OpenGate")
			await anim_play.animation_finished
			anim_play.play("Idle")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		anim_play.play("ExitGate")
		await anim_play.animation_finished
		Controller.emit_signal("interect", false , true, false)
