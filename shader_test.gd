extends Node2D

var circles = []
const num_circles = 100

func _ready() -> void:
	#$Icon.material.set_shader_parameter("millies", Time.get_ticks_msec())
	for i in range(num_circles):
		circles.append_array([randf(), randf(), randf_range(0.05, 0.01)])
	$Icon.material.set_shader_parameter("circles", circles)
	#pass

func _process(_delta):
	#$Icon.material.set_shader_parameter("millies", Time.get_ticks_msec())
	pass
