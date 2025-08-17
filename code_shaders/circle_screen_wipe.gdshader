shader_type canvas_item;

uniform vec2 target = vec2(0.5);
uniform float intensity: hint_range(0.0, 1.0, 0.1) ;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec4 color: source_color;

void fragment() {
	vec2 resolution = 1.0 / SCREEN_PIXEL_SIZE;

	vec2 current_pixel = SCREEN_UV * resolution;
	vec2 target_pixel = vec2(target.x, 1.0 - target.y) * resolution;
	float dist = distance(current_pixel, target_pixel);

	float radius = intensity * length(resolution);

	COLOR = color;
	COLOR.a = clamp(1.0 + dist - radius, 0.0, 1.0);
}
