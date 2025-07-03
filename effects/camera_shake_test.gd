extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
var camera_shake_noise: FastNoiseLite

func _ready() -> void:
	camera_shake_noise = FastNoiseLite.new()
	
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_method(start_camera_shake, 100.0, 1.0, 0.5)
	camera_tween.set_loops(10)
	
func start_camera_shake(intensity: float):
	var camera_offset = camera_shake_noise.get_noise_1d(Time.get_ticks_msec()) * intensity
	camera_2d.offset.x = camera_offset
	camera_2d.offset.y = camera_offset
