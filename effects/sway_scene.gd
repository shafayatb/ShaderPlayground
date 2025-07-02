extends Node2D

@onready var icon: Sprite2D = $Icon

@export var sway_amount: Vector2 = Vector2(16, 0) # sway offset in pixels
@export var sway_duration: float = 1.0           # full back‑and‑forth in seconds

func _ready() -> void:
	sway()

func sway():
	var tween = create_tween()
	tween.tween_property(icon, "position", icon.position + sway_amount, sway_duration / 2.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(icon, "position", icon.position - sway_amount, sway_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(icon, "position",
		icon.position, sway_duration / 2.0
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
