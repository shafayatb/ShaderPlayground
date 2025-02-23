extends Sprite2D

var dark_mode = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		dark_mode = not dark_mode
		check_dark_mode()
		
func check_dark_mode():
	material.set_shader_parameter("invert", dark_mode)
