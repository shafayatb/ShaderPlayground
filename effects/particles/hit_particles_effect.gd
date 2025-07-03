extends Node2D

@onready var icon: Sprite2D = $Icon
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	gpu_particles_2d.restart()
	gpu_particles_2d.emitting = true
