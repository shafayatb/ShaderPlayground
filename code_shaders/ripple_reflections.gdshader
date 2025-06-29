shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float x_offset : hint_range(-0.5, 5.0, 0.001);
uniform float deg : hint_range(0.0, 1000.0, 0.1);
uniform float speed: hint_range(0.0, 500.0, 0.5);
uniform float amount: hint_range(0.0, 0.5, 0.01);

void fragment() {
	float rad = radians(TIME * speed);
	float sin_offset = sin(rad) * amount;
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(sin_offset, 0.0));
}
