extends Node2D

@onready var icon: Sprite2D = $Icon

@export var shake_amplitude: float = 8.0   # max shake distance in px
@export var shake_freq: float = 0.05      # milliseconds between shakes
@export var shake_duration: float = 0.5   # total duration in seconds

func _ready() -> void:
	shake()

func shake():
	var original_pos = icon.position

	var tween = create_tween().set_loops(int(shake_duration / shake_freq))
	for i in range(tween.get_loops_left()):
		# random offset each short interval
		var offset = Vector2(
			randf_range(-shake_amplitude, shake_amplitude),
			randf_range(-shake_amplitude, shake_amplitude)
		)
		tween.tween_property(icon, "position", original_pos + offset, shake_freq)
	# ensure it ends back at the start
	tween.tween_property(icon, "position", original_pos, 0.0)
