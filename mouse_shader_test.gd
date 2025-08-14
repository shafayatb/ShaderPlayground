extends Node2D

@onready var color_rect: ColorRect = $CanvasLayer/ColorRect

func _process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	mouse_position.x /= get_viewport_rect().size.x
	mouse_position.y /= get_viewport_rect().size.y
	color_rect.material.set_shader_parameter("target", mouse_position)
