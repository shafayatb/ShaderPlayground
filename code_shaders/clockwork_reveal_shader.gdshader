shader_type canvas_item;

uniform float fade : hint_range(0.0, 1.0, 0.05) = 0.0;

void fragment() {
	vec2 center = vec2(0.5, 0.5);
	vec2 vec = UV - center;

	float angle = atan(vec.y, vec.x) / (2.0*PI) + 0.5;

	float progress = step(angle, fade);

	COLOR.a *= progress;
}
