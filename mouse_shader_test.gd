extends Node2D

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect
@onready var circle_transition: ColorRect = $CanvasLayer/CircleTransition

var toggle: bool = false

func _process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	mouse_position.x /= get_viewport_rect().size.x
	mouse_position.y /= get_viewport_rect().size.y
	color_rect.material.set_shader_parameter("target", mouse_position)
	circle_transition.material.set_shader_parameter("target", mouse_position)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var tween = create_tween()
		var t = tween.tween_property(
			circle_transition.material,
			"shader_parameter/intensity",
			float(not toggle),
			1
		).from(float(toggle)).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
		toggle = not toggle
