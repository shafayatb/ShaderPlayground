shader_type canvas_item;

uniform vec2 target = vec2(0.5);
uniform float intensity: hint_range(0.0, 1.0, 0.01) ;

void fragment() {
	COLOR = vec4(1.0);
	float x = SCREEN_PIXEL_SIZE.x / distance(vec2(target.x, UV.y), UV);
	float y = SCREEN_PIXEL_SIZE.y / distance(vec2(UV.x, target.y), UV);
	COLOR.a = (x+y) * intensity;
}
